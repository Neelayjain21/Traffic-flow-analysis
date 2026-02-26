# 🚦 Traffic Flow Modeling Using Linear Algebra and State-Space Analysis

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![MATLAB](https://img.shields.io/badge/MATLAB-Compatible-blue.svg)
![Status](https://img.shields.io/badge/Project-Academic-success.svg)

---

## 📖 Overview

This project models a four-junction traffic network using:

- Conservation of vehicles  
- Linear algebraic formulation  
- Behavioral turning ratio constraint  
- Discrete-time state-space modeling  
- Eigenvalue-based stability analysis  

The objective is to:

1. Compute steady-state internal traffic flows  
2. Model gradual traffic redistribution  
3. Evaluate system stability and convergence  

---

# 🗺️ Traffic Network Layout

<img src="results/network_layout.png" width="600">

> Place your network image inside the `results/` folder as `network_layout.png`

---

# 📘 Part I — Static Traffic Flow Model

## Governing Principle

At steady state:

\[
\text{Flow In} = \text{Flow Out}
\]

Applying conservation at each node:

\[
x_1 + x_4 = 475
\]

\[
x_1 + x_2 = 655
\]

\[
x_2 + x_3 = 1050
\]

\[
x_3 + x_4 = 870
\]

---

## Matrix Formulation

\[
AX = B
\]

\[
A =
\begin{bmatrix}
1 & 0 & 0 & 1 \\
1 & 1 & 0 & 0 \\
0 & 1 & 1 & 0 \\
0 & 0 & 1 & 1
\end{bmatrix}
\]

The system is rank deficient:

\[
\text{rank}(A) = 3 < 4
\]

Therefore, an additional behavioral constraint is required.

---

## Turning Ratio Assumption

At node A:

\[
\frac{x_1}{x_4} = \frac{3}{2}
\]

---

## Static Solution

\[
(x_1, x_2, x_3, x_4)
=
(285,\; 370,\; 680,\; 190)
\]

These flows:

- Are non-negative  
- Satisfy conservation  
- Represent feasible steady-state equilibrium  

---

## 🔗 Static Model Code

👉 **[View static_model.m](static_model.m)**

---

# 📘 Part II — Dynamic Traffic Flow Modeling

The static model assumes instantaneous equilibrium.  
To model gradual driver adaptation, a discrete-time state-space formulation is introduced.

---

## State Vector

\[
X(k) =
\begin{bmatrix}
x_1(k) \\
x_2(k) \\
x_3(k) \\
x_4(k)
\end{bmatrix}
\]

---

## Dynamic Evolution Equation

\[
X(k+1) = (1-\alpha)X(k) + \alpha(PX(k) + U)
\]

Rewritten as:

\[
X(k+1) = AX(k) + \alpha U
\]

Where:

\[
A = (1-\alpha)I + \alpha P
\]

---

## Model Parameters

Relaxation parameter:

\[
\alpha = 0.4
\]

Routing matrix:

\[
P =
\begin{bmatrix}
0 & 0 & 0 & 0 \\
0.3 & 0 & 0.35 & 0 \\
0 & 0.7 & 0 & 0 \\
0 & 0 & 0.65 & 0
\end{bmatrix}
\]

External inflow:

\[
U =
\begin{bmatrix}
285 \\
0 \\
0 \\
190
\end{bmatrix}
\]

---

## Steady-State Dynamic Solution

\[
X^* = (I - A)^{-1} \alpha U
\]

\[
(x_1, x_2, x_3, x_4)
=
(285,\; 161.13,\; 112.79,\; 263.31)
\]

---

## Stability Analysis

For discrete-time systems:

\[
|\lambda_i| < 1
\]

Eigenvalues:
0.600
0.600
0.874
0.326


Spectral radius:

\[
\rho(A) = 0.874
\]

Since \(\rho(A) < 1\):

- The system is asymptotically stable  
- Traffic flows converge to equilibrium  
- Disturbances decay over time  

---

## 🔗 Dynamic Model Code

👉 **[View dynamic_model.m](dynamic_model.m)**

---

# 📈 Convergence Simulation

The iterative evolution of traffic flows verifies convergence to equilibrium.

<img src="results/convergence_plot.png" width="600">

> Generated using `convergence_simulation.m`

---

## 🔗 Simulation Code

👉 **[View convergence_simulation.m](convergence_simulation.m)**

---

# ▶️ How to Run

1. Open MATLAB (R2018+ recommended)
2. Run:
static_model.m
dynamic_model.m
convergence_simulation.m


3. Results will appear in the Command Window  
4. Convergence plot will be displayed automatically  

---

# 📊 Key Insights

### Static Model
- Based on conservation laws  
- Requires behavioral constraint  
- Produces unique feasible solution  

### Dynamic Model
- Captures gradual redistribution  
- Enables eigenvalue-based stability analysis  
- Spectral radius determines convergence rate  
- System naturally converges  

---

# 🧠 Assumptions

- Deterministic routing  
- Constant turning probabilities  
- No congestion constraints  
- No stochastic disturbances  

---

# 🚀 Future Work

- Capacity-constrained optimization  
- Nonlinear congestion-dependent routing  
- Sensitivity analysis of α  
- Continuous-time formulation  
- Validation with real traffic data  

---

# 📜 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.
