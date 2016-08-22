function thetas = trainLogReg(X,y, Nclasses,lambda, options)

[N, D] = size(X);

Xext = [ones(N,1) X];

thetas = zeros(Nclasses, D+1);

for c = 1:Nclasses
    
    % set initial thetas
    initial_thetas = zeros(D+1,1);
    
    %
    theta_aux = fmincg(@(t)(lrCostFunction(t, Xext, (y == c), lambda)),...
        initial_thetas, options);
    
    thetas(c,:) = theta_aux;
end

end