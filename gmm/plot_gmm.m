function plot_gmm(X,gmmodel)
%PLOT_GMM. It plots a 2D dataset and a gmmodel
%
%author: Jesus Fernandez Bes
figure(1);

scatter(X(:,1), X(:,2)); hold on;

min_x = min(X(:,1));
max_x = max(X(:,1));

min_y = min(X(:,2));
max_y = max(X(:,2));

xplot = linspace(min_x,max_x,100); %// x axis
yplot =linspace(min_y,max_y,100); %// y axis
[Xplot Yplot] = meshgrid(xplot,yplot); %// all combinations of x, y

for k = 1:gmmodel.K
    Z = mvnpdf([Xplot(:) Yplot(:)],gmmodel.mu(:,k)',gmmodel.Sigma(:,:,k)); %// compute Gaussian pdf
    Z = reshape(Z,size(Xplot)); %// put into same size as X, Y
    scatter(gmmodel.mu(1,k),gmmodel.mu(2,k),'r+','Linewidth',2);
    contour(Xplot,Yplot,Z,3,'Linewidth',2); %// ... or 3D plot    
    
end


end