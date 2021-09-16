function exact(b)
L=1; a=1/2; N=200; x=linspace(0,L,N);  m=5; 
figure(10); hold on;
for i=1:m
    a=a/2; k=b*L/a; y=sol(b,L,k,x); 
    plot(x,y,'LineWidth',1.5);
end
grid on; axis equal; xlabel("x"); ylabel("y");
saveas(10,'exact.pdf');
end
function y = sol(b, L, k, x)
y = x ./ b - (L/b) * (exp(k .* x ./ L)-1) ./ (exp(k) -1); 
%y=(exp(k .* x ./ L)-1) ./ (exp(k) -1); 
end