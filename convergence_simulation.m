%% CONVERGENCE SIMULATION
% Simulates time evolution of traffic flows

clc;
clear;

disp('--- TRAFFIC FLOW CONVERGENCE SIMULATION ---');

%% Parameters

alpha = 0.4;

P = [0    0     0     0;
     0.3  0     0.35  0;
     0    0.7   0     0;
     0    0     0.65  0];

I = eye(4);
A = (1 - alpha)*I + alpha*P;

U = [285;
     0;
     0;
     190];

%% Initial Condition (arbitrary starting point)

X = [100;
     200;
     300;
     150];

steps = 30;

history = zeros(4, steps);

%% Simulation Loop

for k = 1:steps
    X = A*X + alpha*U;
    history(:,k) = X;
end

%% Plot Results

figure;
plot(history','LineWidth',1.8);
xlabel('Time Step');
ylabel('Flow (veh/hr)');
title('Traffic Flow Convergence');
legend('x1','x2','x3','x4','Location','best');
grid on;

disp('Simulation complete. Convergence plot generated.');
