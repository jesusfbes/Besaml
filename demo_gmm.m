clc; clear; close all;

addpath('gmm');

% Parameters
max_iters = 100;
tolerance = 1e-6;
K = 2;

% load OLD FAITHFUL dataset
data_set = importdata('faithful.dat');
X = data_set.data(:,2:end);

% Standarize data, it is problematic for the Covariance matrix if not
% standarized
X = standardizeCols(X);


% Initial Parameters
initial_params.pi = ones(K,1)./ K;
initial_params.mu =  0.1*randn(2,K);
initial_params.Sigma = repmat(1*eye(2),[1 1 K]);


gmmodel = fitgmm_em(X, K, initial_params, max_iters, tolerance);

%% Plot figures
plot_gmm(X,gmmodel);

figure(2);
plot(-gmmodel.loglik)
xlabel('iterations');
ylabel(' - log( likelihood )');
