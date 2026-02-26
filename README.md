# 🚦 Traffic Flow Modeling Using Linear Algebra and State-Space Analysis

## 📖 Overview

This project models a four-junction traffic network using linear algebra and discrete-time state-space analysis.

The objectives are:

- Determine steady-state internal traffic flows
- Apply behavioral routing (turning ratio) constraints
- Model gradual traffic redistribution
- Evaluate stability using eigenvalue analysis

This project demonstrates how classical linear systems theory can be applied to traffic network modeling.

---

## 🗺️ Network Description

The traffic network consists of four junctions:

- A
- B
- C
- D

External inflows and outflows are known. Internal road flows are unknown.

### Internal Flow Variables (veh/hr)

- x1 : A → B
- x2 : C → B
- x3 : C → D
- x4 : A → D

---

# 📘 Part I — Static Traffic Flow Model

## Governing Principle

At steady state:

Flow In = Flow Out

Applying conservation at each junction:

x1 + x4 = 475  
x1 + x2 = 655  
x2 + x3 = 1050  
x3 + x4 = 870  

---

## Matrix Formulation

AX = B

Where:

A =  
[ 1  0  0  1  
  1  1  0  0  
  0  1  1  0  
  0  0  1  1 ]

The system is rank deficient:

rank(A) = 3 < 4

Therefore, an additional behavioral constraint is required.

---

## Turning Ratio Assumption

At node A:

- 60% traffic goes to B
- 40% traffic goes to D

x1 / x4 = 3 / 2

---

## Static Solution

x1 = 285 veh/hr  
x2 = 370 veh/hr  
x3 = 680 veh/hr  
x4 = 190 veh/hr  

These flows:

- Are non-negative
- Satisfy conservation
- Represent feasible steady-state equilibrium

---

# 📘 Part II — Dynamic Traffic Flow Modeling

The static model assumes instantaneous equilibrium.  
To capture gradual driver adaptation, a discrete-time state-space formulation is used.

---

## State Vector

X(k) = [ x1(k)  x2(k)  x3(k)  x4(k) ]ᵀ

---

## Dynamic Evolution Equation

X(k+1) = (1 − α)X(k) + α(PX(k) + U)

Rewritten as:

X(k+1) = AX(k) + αU

Where:

A = (1 − α)I + αP

---

## Model Parameters

Routing matrix:

P =  
[ 0    0     0     0  
  0.3  0     0.35  0  
  0    0.7   0     0  
  0    0     0.65  0 ]

External inflow:

U = [285  0  0  190]ᵀ

Relaxation parameter:

α = 0.4

---

## Steady-State Dynamic Solution

X* = (I − A)⁻¹ αU

Result:

x1 = 285.00  
x2 = 161.13  
x3 = 112.79  
x4 = 263.31  

---

## Stability Analysis

For discrete-time systems:

|λᵢ| < 1

Eigenvalues of A:

0.600  
0.600  
0.874  
0.326  

Spectral radius:

ρ(A) = 0.874

Since ρ(A) < 1:

- The system is asymptotically stable
- Traffic flows converge to equilibrium
- Disturbances decay over time

---

# 📂 Repository Structure

Traffic-Flow-Model/
│
├── static_model.m
├── dynamic_model.m
├── convergence_simulation.m
├── results/
│   ├── static_output.txt
│   ├── dynamic_output.txt
│   └── convergence_plot.png
└── README.md

---

# 💻 Code Description

static_model.m
- Solves augmented linear system
- Computes steady-state flows

dynamic_model.m
- Builds state-space matrix
- Computes steady-state dynamic solution
- Calculates eigenvalues

convergence_simulation.m
- Simulates traffic redistribution
- Generates convergence plots

---

# ▶️ How to Run

1. Open MATLAB (R2018+ recommended)
2. Run:

static_model  
dynamic_model  
convergence_simulation  

3. Results will appear in the command window.
4. Convergence plot will display automatically.

---

# 📊 Key Insights

Static Model
- Based on conservation laws
- Requires behavioral constraint
- Produces unique feasible solution

Dynamic Model
- Captures gradual traffic redistribution
- Enables eigenvalue-based stability analysis
- Spectral radius determines convergence rate
- System naturally converges to equilibrium

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

This project is intended for academic and educational use.
