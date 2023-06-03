clear all;
d = 1;
e = 3/4;
m = 1/8;
f = 0;
N = 10000;
length = 25;
shag = length/(N-1);
e = e/d;
m = m/d;
f = f/d;
alfa(N) = 0;
beta(N) = 0;
alfa(1) = 1;
beta(1) = 0;
for i=2:N
 ai = shag*e/2 - 1;
 bi = 2 - shag*shag*m;
 ci = -shag*e/2 - 1;
 fi = f;
 alfa(i) = -ci/(bi+ai*alfa(i-1));
 beta(i) = -(ai*beta(i-1) + shag*shag*fi)/(bi+ai*alfa(i-1));
end
y(N) = -0.0084;
for i=N-1:-1:1
 y(i) = alfa(i)*y(i+1)+beta(i);
end
plot(shag*(0:N-1),y);
