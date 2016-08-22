clc;clear; close all;

load ex3data1.mat
% y and X

rng(1);

% Data dimensions
[N,D] = size(X);

%Params

%Clasifier options
options = optimset('GradObj','on','MaxIter',100);

lambda = 0.01;

% number of classes, indexed from 1 to Nclasses 
Nclasses = 10;


% Tran test splitting
[index_train, index_test, N_train, N_test] = train_test_split(N,0.7,true);

X_train = X(index_train,:);
y_train = y(index_train);

X_test = X(index_test,:);

% TRAINING
thetas = trainLogReg(X_train,y_train, Nclasses,lambda, options);

% PREDICTION
[y_pred_tr] = predictLogReg(thetas, X_train);

[y_pred_tst,p] = predictLogReg(thetas, X_test);

% Print confusion matrix
conf = compute_confusion(y_pred_tst,y(index_test),Nclasses);
imagesc(conf);

% compute accuracies
acc_train = sum(y_pred_tr==y(index_train))/N_train

acc_test = sum(y_pred_tst==y(index_test))/N_test