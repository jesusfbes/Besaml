function conf = compute_confusion(p,y,Nclasses)
%COMPUTE_CONFUSION. Compute a confusion matrix.
%
%author: Jesus Fernandez-Bes

conf = zeros(Nclasses,Nclasses);

for c_pred = 1:Nclasses
    
   for c_real = 1:Nclasses
       
       conf(c_pred,c_real) = sum( y==c_real & p==c_pred );
       
   end
end