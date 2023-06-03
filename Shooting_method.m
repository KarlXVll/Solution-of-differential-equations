clear all;
d = 1;
e = 3/4;
m = 1/8;
h = 25;
yh = 0.012;
y0 = [3 1];
ymin = -1000;
ymax = 1000;
tspan = [0 h];
[t, y] = ode45(@(t,y) odefcn(t,y,d,e,m), tspan, y0);
pogr = 1e-6;
iterat = 0;
while (abs(y(end, 1) - yh) > pogr) && iterat < 10000
 if(y(end, 1) > yh)
 ymax = y0(1);
 else
 ymin = y0(1);
 end
 y0(1)=(ymin+ymax)/2;
 [t, y] = ode45(@(t,y) odefcn(t,y,d,e,m), tspan, y0);
 iterat = iterat + 1;
end
plot(t,y(:,1), 'b', t,y(:,2), 'r');
