clc;
clear;
close all;
prompt = 'Enter N' %user will input N
prompt1 = 'Enter k' %user will input k
N=input(prompt);
k= input(prompt1);
h= 1/N; 
A= zeros(N,N); %creates matrix nxn
for c = 1:N %for loop to make coeff matrix
    for r = 1:N
        
        if r == c
            A(r,c) = -(2+k^2*h^2);
        elseif abs(r-c) == 1
            A(r,c) = 1;
        else
            A(r,c) = 0;
        end
        
    end
end
A;
F= zeros(N,1); %creates zero matrix for solution
for d = 1:N %filling in matrix with value using loop and conditional statements
    if d == 1
        F(d,1)= -1 + h^2;
    elseif d== N
        F(N,1)= h^2;
    else 
        F(d,1)= h^2;
    end
end
F;
F_1= F(1:N-1,1); %reducing matrix since u(L)=0
A_1= A(1:N-1,1:N-1); %reducing matrix since u(L)=0
U= A_1\F_1; %solving for u
x= h:h:1-h; %creating x vector to plot
y=(-1+(sinh(k-k*x) + sinh(k*x))/sinh(k))*(1/k^2) + (sinh(k-k*x))/sinh(k); %given exact function
p=plot(x,U,'g',x,y,'k') %plotting exact vs approximate value
p(1).Marker= '*'
legend('approximate value', 'real value');
%input N=~ 5120 for k=10 and k=100 to obtain results with low error