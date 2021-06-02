syms x n pi
sum=0;
% I have let Time Period T=1 and spring constant k=1000N/m and mass=1kg 
T=1;
% m=1;
% k=1000;
% w=sqrt(k/m);
w0=2*pi/T;
% rn=n*w0/w
k=1;
rn=200*n;





 
% Defining Square Wave Function 
   y = piecewise(round(x)<=x,1,round(x)>x,-1);
  

% Calculating a0 an bn
    a0=(1/T)*(int(1,x,0,0.5)+int(-1,x,0.5,1));
    an=(2/T)*(int(cos(n*w0*x),x,0,0.5)+int(-cos(n*w0*x),x,0.5,1));   
    bn=(2/T)*(int(sin(n*w0*x),x,0,0.5)+int(-sin(n*w0*x),x,0.5,1));
    
    an1=subs(an,n,1:7)
    bn1=subs(bn,n,1:7)
    
    

% Plotting Square wave function with Fourier Function  
% this graph is basically F(t)/F0 to t/T0 graph
 
An1 = an*cos(n*w0*x);
Bn1 = bn*sin(n*w0*x);

    an2=subs(An1,n,1:7)
    bn2=subs(Bn1,n,1:7)
    
figure(1)
    fplot(y,[0,1])
    hold on
        fplot(fp(3,An1,Bn1,n,a0),[0,1])   % for n=3
        fplot(fp(5,An1,Bn1,n,a0),[0,1])   % for n=5
        fplot(fp(7,An1,Bn1,n,a0),[0,1])   % for n=7
    hold off
grid

    

% Plotting Steady State respose 
 
An2 = (an*cos(n*w0*x))/(k*(1-rn^2));
Bn2 = (bn*sin(n*w0*x))/(k*(1-rn^2));

figure(2)
   % fplot(y,[0,1])
    hold on
        fplot(fp(3,An2,Bn2,n,a0),[0,10])
       % fplot(fp(5,An2,Bn2,n,a0),[0,1])
       % fplot(fp(7,An2,Bn2,n,a0),[0,1])
    hold off
grid
 
 
 
 
   % function to create sum for Fourier Function
    function p = fp(n1,an,bn,n,a0)
      
    An=subs(an,n,1:n1);
    Bn=subs(bn,n,1:n1);
    sum=a0;
    for i=1:n1
        sum=sum+An(i);
    end
    for i=1:n1
        sum=sum+Bn(i);
    end 
    p = sum;
    
end

