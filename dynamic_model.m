%% DYNAMIC TRAFFIC FLOW MODEL
% State-space formulation and stability analysis

clc;
clear;

disp('--- DYNAMIC TRAFFIC FLOW MODEL ---');

%% Parameters

alpha = 0.4;   % Relaxation parameter

%% Routing Matrix

P = [0    0     0     0;
     0.3  0     0.35  0;
     0    0.7   0     0;
     0    0     0.65  0];

I = eye(4);

%% State Matrix

A = (1 - alpha)*I + alpha*P;

%% External Inflow Vector

U = [285;
     0;
     0;
     190];

%% Steady-State Solution

X_star = (eye(4) - A) \ (alpha * U);

%% Eigenvalue Analysis

lambda = eig(A);

%% Display Results

fprintf('\nSteady-State Traffic Flows (veh/hr):\n');
fprintf('x1 = %.2f\n', X_star(1));
fprintf('x2 = %.2f\n', X_star(2));
fprintf('x3 = %.2f\n', X_star(3));
fprintf('x4 = %.2f\n\n', X_star(4));

fprintf('Eigenvalues of A:\n');
disp(lambda);

fprintf('Spectral Radius = %.4f\n', max(abs(lambda)));

disp('----------------------------------');
