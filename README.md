# 🚦 Traffic Flow Modeling Using Linear Algebra & State-Space Analysis

![MATLAB](https://img.shields.io/badge/MATLAB-R2021a%2B-orange?logo=mathworks)
![License](https://img.shields.io/badge/License-MIT-blue)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

> A four-junction traffic network modeled using conservation laws, linear algebra, and discrete-time state-space analysis — with eigenvalue-based stability verification.

---

## 📌 Overview

This project models steady-state and dynamic traffic flow across a four-junction road network. It covers:

- ✔ Conservation of vehicles at each junction
- ✔ Linear algebraic formulation (`AX = B`)
- ✔ Behavioral turning ratio constraint to resolve rank deficiency
- ✔ Discrete-time state-space modeling for dynamic adaptation
- ✔ Eigenvalue-based stability analysis (spectral radius criterion)

---

## 🗺️ Network Layout

The network consists of four junctions (A, B, C, D) with internal flows `x₁, x₂, x₃, x₄` and fixed external inflows/outflows at each node.

```
        [A] ──x₁──▶ [B]
         ▲              │
         x₄            x₂
         │              ▼
        [D] ◀──x₃── [C]
```

---

## 📘 Part I — Static Traffic Flow Model

### Governing Principle

At steady state: **Flow In = Flow Out** at every junction.

| Node | Equation              |
|------|-----------------------|
| A    | x₁ + x₄ = 475        |
| B    | x₁ + x₂ = 655        |
| C    | x₂ + x₃ = 1050       |
| D    | x₃ + x₄ = 870        |

### Matrix Formulation

![AX=B](https://latex.codecogs.com/png.image?\dpi{120}AX=B)

![A and B](https://latex.codecogs.com/png.image?\dpi{120}A=\begin{bmatrix}1&0&0&1\\1&1&0&0\\0&1&1&0\\0&0&1&1\end{bmatrix},\quad%20B=\begin{bmatrix}475\\655\\1050\\870\end{bmatrix})

Since `rank(A) = 3 < 4`, the system is rank deficient and has infinitely many solutions without an additional constraint.

### Turning Ratio Constraint

At node A, drivers split according to:

![Turning ratio](https://latex.codecogs.com/png.image?\dpi{120}\frac{x_1}{x_4}=\frac{3}{2})

This behavioral constraint closes the system and yields a unique solution.

### ✅ Static Solution

| Flow | Value (veh/hr) |
|------|----------------|
| x₁   | 285            |
| x₂   | 370            |
| x₃   | 680            |
| x₄   | 190            |

- ✔ Non-negative flows
- ✔ Satisfies all conservation equations
- ✔ Unique feasible solution

---

## 📘 Part II — Dynamic Traffic Flow Model

The static model assumes instantaneous equilibrium. To model gradual driver adaptation, a discrete-time state-space system is used.

### Dynamic Equation

![Dynamic equation](https://latex.codecogs.com/png.image?\dpi{120}X(k+1)=\left[(1-\alpha)I+\alpha%20P\right]X(k)+\alpha%20U)

### Model Parameters

**Relaxation parameter:** `α = 0.4`

**Routing matrix:**

![P matrix](https://latex.codecogs.com/png.image?\dpi{120}P=\begin{bmatrix}0&0&0&0\\0.3&0&0.35&0\\0&0.7&0&0\\0&0&0.65&0\end{bmatrix})

![U vector](https://latex.codecogs.com/png.image?\dpi{120}U=\begin{bmatrix}285\\0\\0\\190\end{bmatrix})

### ✅ Dynamic Steady-State Solution

| Flow | Value (veh/hr) |
|------|----------------|
| x₁   | 285.00         |
| x₂   | 161.13         |
| x₃   | 112.79         |
| x₄   | 263.31         |

### 📊 Stability Analysis

| Eigenvalue | Value |
|------------|-------|
| λ₁         | 0.600 |
| λ₂         | 0.600 |
| λ₃         | 0.874 |
| λ₄         | 0.326 |

![Spectral radius](https://latex.codecogs.com/png.image?\dpi{120}\rho(A_d)=0.874<1)

- ✔ Asymptotically stable
- ✔ All disturbances decay over time
- ✔ System converges to equilibrium regardless of initial conditions

---

## 📈 Convergence Simulation

The simulation initializes flows at zero and iterates the state-space equation until convergence. All four flows smoothly reach their steady-state values within ~30 time steps.

> 📷 *Convergence plot saved to `results/convergence_plot.png`*

---

## ▶️ How to Run

Clone the repository and run each script in MATLAB:

```matlab
% Step 1 — Solve static model
static_model

% Step 2 — Solve dynamic model and compute eigenvalues
dynamic_model

% Step 3 — Simulate and plot convergence
convergence_simulation
```

Results are printed to the MATLAB command window. The convergence plot renders automatically.

> **Requirements:** MATLAB R2021a or later (no additional toolboxes required).

---

## 📂 Repository Structure

```
Traffic-Flow-Model/
│
├── static_model.m            # Part I: Linear system + turning ratio constraint
├── dynamic_model.m           # Part II: State-space formulation + eigenanalysis
├── convergence_simulation.m  # Iterative simulation + convergence plot
│
├── results/
│   ├── problem.png           # Network diagram
│   └── convergence_plot.png  # Simulation output
│
├── LICENSE
└── README.md
```

---

## 🧠 Key Insights

**Static Model**
- The node-balance system is rank deficient; a turning ratio constraint is required to obtain a unique solution.
- The constraint encodes driver behavior and is physically motivated.

**Dynamic Model**
- Captures the gradual redistribution of traffic as drivers adapt over time.
- The relaxation parameter `α` controls convergence speed — larger `α` means faster but potentially less stable adaptation.
- The spectral radius `ρ(Aᵈ) < 1` guarantees asymptotic stability for all `α ∈ (0, 1)` with this routing matrix.

---

## 🚀 Future Work

- Capacity-constrained optimization (link flow upper bounds)
- Nonlinear congestion modeling (e.g., BPR function)
- Sensitivity analysis of `α` on convergence rate
- Continuous-time formulation via ODEs
- Validation against real-world traffic count data

---

## 📜 License

Licensed under the [MIT License](LICENSE).
