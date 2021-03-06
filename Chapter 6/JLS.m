function G = JLS(alpha,L)
% Modified version of Choi-Williams determining function
% Modified by one of the authors.
%  Initializaton
L_2 = round(L/2);     % Number of points in each quadrant
for u = 1:L_2	
   for tau = 1:L_2
       G(u,tau) = exp(-alpha*((u-1)*(tau-1))^2);
   end
end
% Expand to 4 quandrents
G = [fliplr(G(:,2:end))  G];         % Add 2nd quadrant
G = [flipud(G(2:end,:)); G];	  	% Add 3rd and 4th quadrants
 
 
 
