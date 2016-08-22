function gmmodel = fitgmm_em(X, K, initial_params, max_iters,tolerance)
%FITGMM_EM. Fit a GMM of K components using a dataset X
%
%author: Jesus Fernandez-Bes

N = size(X, 1);

% preallocation
p = zeros(N, K);
r_aux = zeros(N, K);


mu = initial_params.mu;
Sigma = initial_params.Sigma;
pi = initial_params.pi;

loglik = zeros(max_iters,1);
loglik(1) = -inf;

for t = 1:max_iters
    
    % E STEP
    for k =1:K
        
        p(:,k) = mvnpdf(X, mu(:,k)', Sigma(:,:,k));
        
        r_aux(:,k) = pi(k) .* p(:,k);
           
    end
   
    r = bsxfun(@rdivide, r_aux, sum(r_aux,2));
    
    r_k = sum(r);
    
    % M STEP
    
    % Pi
    pi =  r_k ./N;
    
    for k = 1:K
        
        % Mu
        mu_unorm = bsxfun(@times,X,r(:,k));
        mu(:,k) = sum(mu_unorm) ./ r_k(k);
        
        
        %TODO: Check!!!!
        acc_Sigma = 0;
        for i = 1:N
            x_i = X(i,:) - mu(:,k)';
            acc_Sigma = acc_Sigma + (r(i,k).* (x_i'*x_i)) ;
        end
        Sigma(:,:,k) = acc_Sigma ./ r_k(k);
        
    end
    
    sum_k = zeros(N,1);
    
    % Compute loglikelihood
    for k = 1:K
        sum_k = sum_k + ( pi(k) .* mvnpdf(X, mu(:,k)', Sigma(:,:,k)));
    end
    
    % sum_N( logsum_K(pi_k * N(x_i,theta_k) )  )
    loglik(t+1) = sum(log(sum_k));
    
    % Check convergence
    
    
    if (abs( loglik(t+1) - loglik(t)) < tolerance ) % converged
        break; % leave the loop
    end    
    
end

gmmodel.K = K;
gmmodel.mu = mu;
gmmodel.Sigma = Sigma;
gmmodel.pi = pi;
gmmodel.loglik = loglik(1:t);
gmmodel.total_iters = t;


end