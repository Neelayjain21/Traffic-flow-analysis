🚦 Traffic Flow Modeling Using Linear Algebra and State-Space Analysis
📌 Project Overview

This project presents a mathematical modeling framework for a four-junction traffic network using:

Conservation of vehicles

Linear algebraic systems

Behavioral turning ratio constraints

Discrete-time state-space modeling

Eigenvalue-based stability analysis

The objective is to:

Determine steady-state traffic flows.

Analyze dynamic redistribution under driver adaptation.

Evaluate system stability using spectral properties.

This project demonstrates how classical linear systems theory can be applied to traffic network analysis.

🗺️ Network Description

The traffic network consists of four junctions:

A

B

C

D

External inflows and outflows are known. Internal road flows are unknown.

Internal Flow Variables (veh/hr)

x1 : A → B

x2 : C → B

x3 : C → D

x4 : A → D

All flows are measured in vehicles per hour (veh/hr).

📘 Part I — Static Traffic Flow Model
🔹 Governing Principle

Under steady-state conditions:

Flow In = Flow Out

Applying conservation at each junction:

x1 + x4 = 475
x1 + x2 = 655
x2 + x3 = 1050
x3 + x4 = 870
🔹 Matrix Formulation

The system can be written as:

AX = B

Where:

A = [ 1  0  0  1
      1  1  0  0
      0  1  1  0
      0  0  1  1 ]

X = [x1 x2 x3 x4]^T

The matrix is rank deficient:

rank(A) = 3 < 4

Therefore, the system has infinitely many solutions and requires a behavioral constraint.

🔹 Turning Ratio Assumption

At node A:

60% of traffic goes to B

40% goes to D

x1 / x4 = 3 / 2
🔹 Static Solution

The resulting steady-state flows are:

x1 = 285 veh/hr
x2 = 370 veh/hr
x3 = 680 veh/hr
x4 = 190 veh/hr

All flows:

Are non-negative

Satisfy conservation

Represent a feasible equilibrium distribution

📘 Part II — Dynamic Traffic Flow Modeling

The static model assumes instantaneous equilibrium.
To model gradual driver adaptation, a discrete-time state-space formulation is used.

🔹 State Vector
X(k) = [ x1(k)  x2(k)  x3(k)  x4(k) ]^T
🔹 Dynamic Evolution Equation
X(k+1) = (1 - α)X(k) + α(PX(k) + U)

Rewritten as:

X(k+1) = AX(k) + αU

Where:

A = (1 - α)I + αP
🔹 Model Parameters

Routing matrix:

P = [ 0    0     0     0
      0.3  0     0.35  0
      0    0.7   0     0
      0    0     0.65  0 ]

External inflow:

U = [285  0  0  190]^T

Relaxation parameter:

α = 0.4
🔹 Steady-State Dynamic Solution

The long-term equilibrium is obtained from:

X* = (I - A)^(-1) αU

Result:

x1 = 285.00
x2 = 161.13
x3 = 112.79
x4 = 263.31
🔹 Stability Analysis

For discrete-time systems, stability requires:

|λ_i| < 1

Eigenvalues of A:

0.600
0.600
0.874
0.326

Spectral radius:

ρ(A) = 0.874

Since ρ(A) < 1:

The system is asymptotically stable.

Traffic flows converge to equilibrium.

Disturbances decay over time.
