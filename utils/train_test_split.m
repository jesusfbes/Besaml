function [index_train, index_test, N_train, N_test] = train_test_split(N, prop_train, random)
%TRAIN_TEST_SPLIT.
%
%author: Jesus Fernandez-Bes

if random 
    indexes = randperm(N);
else
    indexes = 1:N ;    
end
N_train = ceil(prop_train*N);
N_test = N - N_train;

index_train = indexes(1:N_train);
index_test = indexes(N_train+1:end);

end
