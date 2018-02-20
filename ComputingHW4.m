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
F= zeros(N,1);
for d = 1:N
    if d == 1
        F(d,1)= -1 + h^2;
    elseif d== N
        F(N,1)= h^2;
    else 
        F(d,1)= h^2;
    end
end
F;
F_1= F(1:N-1,1);
A_1= A(1:N-1,1:N-1);
U= A_1\F_1;
x= h:h:1-h;
y=(1-(sinh(k-k*x) + sinh(k*x))/sinh(k))*(1/k^2) + (sinh(k-k*x))/sinh(k);
p=plot(x,U,'g',x,y,'k')
p(1).Marker= '*'
legend('approximate value', 'real value');