function [force] = force1(p,t,givenfunc)
np = size(p,2); nt = size(t,2); force = zeros(np,1);
for l = 1:nt
  tlocal=t(1:3,l); x=p(1,tlocal); y=p(2,tlocal); [area,b,c]=P1grad(x,y);  
  Mlocal = [2 1 1; 1 2 1; 1 1 2]/12*area; 
  %force term 
  %flocal=givenfunc(0,x,y)'/3*area;
  flocal=Mlocal*givenfunc(0,x,y)'; force(tlocal)=force(tlocal)+flocal; 
end
end
