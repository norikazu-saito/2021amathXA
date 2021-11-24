function p1fem1(datafile,givenfunc)
% read mesh data
[deg,p,idp,t,idt,e,ide,d,idd] = getmesh(datafile);
% coefficients 
%coef_c = 1.0; coef_q = 1.0; coef_kappa = 1.0; 
coef_c = 1.0; coef_q = 0.0; coef_kappa = 0.0;
% stiffnes/mass matrices and force term
[K, M, b] = matrix1(p,t,givenfunc);
% Robin BC
[R, rho] = boundary1(p,e,coef_kappa,givenfunc);
% global coefficient matrix
Aglobal = coef_c*K + coef_q*M + coef_kappa*R;
% global right-hand side vector 
bglobal = b + rho;
% Dirichlet BC and solving Au=b 
[A,b,usol] = dirichlet1(p,d,Aglobal,bglobal,givenfunc); 
% 3D plot
figure(5); plot_p1fem(p,t,usol); saveas(5,"p1fem1.pdf");
% output resuts
F1=fopen("p1fem1.res","w"); Z=[p;usol']; 
fprintf(F1,"%f %f %f\n",Z); fclose(F1);
end