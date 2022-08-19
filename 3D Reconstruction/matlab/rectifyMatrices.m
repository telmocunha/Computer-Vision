function [M1, M2, K1n, K2n, R1n, R2n, t1n, t2n] = ...
                        rectifyMatrices(K1, K2, R1, R2, t1, t2)
%  rectifyMatrices takes left and right camera paramters (K, R, T) and returns left
%   and right rectification matrices (M1, M2) and updated camera parameters. You
%   can test your function using the provided script q4rectify.m

c1=-inv(K1*R1)*K1*t1;

c2=-inv(K2*R2)*K2*t2;

r1=((c2-c1)/(norm(c2-c1)))';
r2=cross(R1(3,:),r1);
r3=cross(r1,r2);

R1n=[r1;r2;r3];

r21=((c2-c1)/(norm(c2-c1)))';
r22=cross(R2(3,:),r21);
r23=cross(r21,r22);

R2n=[r21;r22;r23];

klinha=K2;

%outputs
K1n=klinha;
K2n=klinha;
t1n=-R1n*c1;
t2n=-R2n*c2;
M1=klinha*R1n*inv(K1*R1);
M2=klinha*R2n*inv(K2*R2);

end