🚦 Traffic Flow Modeling Using Linear Algebra and State-Space Analysis
📌 Project Overview

This project models a four-junction traffic network using:

Conservation of vehicles

Linear algebraic systems

Behavioral constraints (turning ratios)

Discrete-time state-space modeling

Eigenvalue-based stability analysis

The objective is to:

Determine steady-state traffic flows.

Analyze dynamic redistribution of traffic.

Evaluate system stability using spectral analysis.

This project demonstrates how classical linear systems theory can be applied to traffic network modeling.

🗺️ Network Description

The network consists of four junctions:

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

📘 Part I — Static Traffic Flow Model
🔹 Governing Principle

Under steady-state conditions:

Flow In
=
Flow Out
Flow In=Flow Out

Applying conservation at each node:

𝑥
1
+
𝑥
4
=
475
x
1
	​

+x
4
	​

=475
𝑥
1
+
𝑥
2
=
655
x
1
	​

+x
2
	​

=655
𝑥
2
+
𝑥
3
=
1050
x
2
	​

+x
3
	​

=1050
𝑥
3
+
𝑥
4
=
870
x
3
	​

+x
4
	​

=870
🔹 Matrix Formulation
𝐴
𝑋
=
𝐵
AX=B

Where:

𝐴
=
[
1
	
0
	
0
	
1


1
	
1
	
0
	
0


0
	
1
	
1
	
0


0
	
0
	
1
	
1
]
A=
	​

1
1
0
0
	​

0
1
1
0
	​

0
0
1
1
	​

1
0
0
1
	​

	​


The system is rank deficient:

rank
(
𝐴
)
=
3
<
4
rank(A)=3<4

Therefore, an additional behavioral constraint is required.

🔹 Turning Ratio Assumption

At node A:

60% traffic goes to B

40% goes to D

𝑥
1
𝑥
4
=
3
2
x
4
	​

x
1
	​

	​

=
2
3
	​

🔹 Static Solution
(
𝑥
1
,
𝑥
2
,
𝑥
3
,
𝑥
4
)
=
(
285
,
  
370
,
  
680
,
  
190
)
(x
1
	​

,x
2
	​

,x
3
	​

,x
4
	​

)=(285,370,680,190)

All flows:

Are non-negative

Satisfy conservation

Represent feasible equilibrium

📘 Part II — Dynamic Traffic Flow Modeling

The static model assumes instantaneous equilibrium. Real traffic adjusts gradually due to driver behavior.

🔹 State-Space Representation
𝑋
(
𝑘
)
=
[
𝑥
1
(
𝑘
)


𝑥
2
(
𝑘
)


𝑥
3
(
𝑘
)


𝑥
4
(
𝑘
)
]
X(k)=
	​

x
1
	​

(k)
x
2
	​

(k)
x
3
	​

(k)
x
4
	​

(k)
	​

	​


Dynamic evolution:

𝑋
(
𝑘
+
1
)
=
(
1
−
𝛼
)
𝑋
(
𝑘
)
+
𝛼
(
𝑃
𝑋
(
𝑘
)
+
𝑈
)
X(k+1)=(1−α)X(k)+α(PX(k)+U)

Rewritten as:

𝑋
(
𝑘
+
1
)
=
𝐴
𝑋
(
𝑘
)
+
𝛼
𝑈
X(k+1)=AX(k)+αU

Where:

𝐴
=
(
1
−
𝛼
)
𝐼
+
𝛼
𝑃
A=(1−α)I+αP
🔹 Model Parameters

Routing matrix:

𝑃
=
[
0
	
0
	
0
	
0


0.3
	
0
	
0.35
	
0


0
	
0.7
	
0
	
0


0
	
0
	
0.65
	
0
]
P=
	​

0
0.3
0
0
	​

0
0
0.7
0
	​

0
0.35
0
0.65
	​

0
0
0
0
	​

	​


External inflow vector:

𝑈
=
[
285


0


0


190
]
U=
	​

285
0
0
190
	​

	​


Relaxation parameter:

𝛼
=
0.4
α=0.4
🔹 Steady-State Dynamic Solution
𝑋
∗
=
(
𝐼
−
𝐴
)
−
1
𝛼
𝑈
X
∗
=(I−A)
−1
αU
(
𝑥
1
,
𝑥
2
,
𝑥
3
,
𝑥
4
)
=
(
285
,
  
161.13
,
  
112.79
,
  
263.31
)
(x
1
	​

,x
2
	​

,x
3
	​

,x
4
	​

)=(285,161.13,112.79,263.31)
🔹 Stability Analysis

Stability condition:

∣
𝜆
𝑖
∣
<
1
∣λ
i
	​

∣<1

Eigenvalues:

0.600
0.600
0.874
0.326

Spectral radius:

𝜌
(
𝐴
)
=
0.874
ρ(A)=0.874

Since ρ(A) < 1:

The system is asymptotically stable.

Traffic flows converge to equilibrium.

Disturbances decay over time.
