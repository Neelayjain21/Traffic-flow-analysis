# 🚦 Traffic Flow Modeling Using Linear Algebra & State-Space Analysis

<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg">
  <img src="https://img.shields.io/badge/MATLAB-Compatible-blue.svg">
  <img src="https://img.shields.io/badge/Status-Academic-success.svg">
</p>

---

## 📌 Overview

This project models a four-junction traffic network using:

- ✔ Conservation of vehicles  
- ✔ Linear algebraic formulation  
- ✔ Behavioral turning ratio constraint  
- ✔ Discrete-time state-space modeling  
- ✔ Eigenvalue-based stability analysis  

The goal is to compute steady-state traffic flows and evaluate whether the network naturally converges to equilibrium.

---

# 🗺️ Traffic Network Layout

<p align="center">
  <img src="results/problem.png" width="600">
</p>

---

# 📘 Part I — Static Traffic Flow Model

## 1️⃣ Governing Principle

At steady state:

\[
\textbf{Flow In = Flow Out}
\]

Node balance equations:

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

## 2️⃣ Matrix Formulation

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

\[
\text{rank}(A) = 3 < 4
\]

Since the matrix is rank deficient, a behavioral constraint is required.

---

## 3️⃣ Turning Ratio Constraint

At node A:

\[
\frac{x_1}{x_4} = \frac{3}{2}
\]

---

## ✅ Static Solution

| Flow | Value (veh/hr) |
|------|----------------|
| x1   | 285 |
| x2   | 370 |
| x3   | 680 |
| x4   | 190 |

✔ Non-negative  
✔ Satisfies conservation  
✔ Unique feasible solution  

---

### 🔗 Static Model Implementation

👉 **[View static_model.m](static_model.m)**

---

# 📘 Part II — Dynamic Traffic Flow Modeling

The static model assumes instantaneous equilibrium.  
To model gradual driver adaptation, a discrete-time state-space formulation is used.

---

## 1️⃣ State Vector

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

## 2️⃣ Dynamic Equation

\[
X(k+1) = (1-\alpha)X(k) + \alpha(PX(k) + U)
\]

Rewritten as:

\[
X(k+1) = AX(k) + \alpha U
\]

\[
A = (1-\alpha)I + \alpha P
\]

---

## 3️⃣ Model Parameters

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

## ✅ Dynamic Steady-State Solution

| Flow | Value (veh/hr) |
|------|----------------|
| x1   | 285.00 |
| x2   | 161.13 |
| x3   | 112.79 |
| x4   | 263.31 |

---

## 📊 Stability Analysis

Eigenvalues:
0.600
0.600
0.874
0.326


Spectral radius:

\[
\rho(A) = 0.874 < 1
\]

✔ Asymptotically stable  
✔ Converges to equilibrium  
✔ Disturbances decay  

---

### 🔗 Dynamic Model Implementation

👉 **[View dynamic_model.m](dynamic_model.m)**

---

# 📈 Convergence Simulation

<p align="center">
  <img src="results/convergence_plot.png" width="600">
</p>

---

### 🔗 Simulation Code

👉 **[View convergence_simulation.m](convergence_simulation.m)**

---

# ▶️ How to Run

```matlab
static_model
dynamic_model
convergence_simulation

Outputs appear in the MATLAB command window.
The convergence plot will display automatically.
