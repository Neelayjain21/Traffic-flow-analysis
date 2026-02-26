%% STATIC TRAFFIC FLOW MODEL
% Solves the linear system with turning ratio constraint

clc;
clear;

disp('--- STATIC TRAFFIC FLOW MODEL ---');

%% Coefficient Matrix (including turning ratio equation)

A = [ 1  0  0  1;
      1  1  0  0;
      0  1  1  0;
      0  0  1  1;
      1  0  0  -3/2 ];   % Turning ratio constraint

B = [475;
     655;
     1050;
     870;
     0];

%% Solve the system

x = A \ B;

%% Display Results

fprintf('\nStatic Traffic Flows (veh/hr):\n');
fprintf('x1 (A → B) = %.2f\n', x(1));
fprintf('x2 (C → B) = %.2f\n', x(2));
fprintf('x3 (C → D) = %.2f\n', x(3));
fprintf('x4 (A → D) = %.2f\n', x(4));

disp('----------------------------------');
