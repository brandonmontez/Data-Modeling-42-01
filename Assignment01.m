% Brandon Montez
% 10 - 15 - 2022

clear
clc

% Parameters
b = [0.03 0.0001 0.003];
g = [0.02 0.00001 0.001];
p = [0.2 0.99 0.7];
a = [0 0 0];

% Initial Conditions
RUMOR_STRT = 1;
POP = 1000 - RUMOR_STRT;

IC = [POP RUMOR_STRT 0];

% ODEs
f1 = @(t,x1) [-x1(2) * x1(1) * b(1); x1(2) * x1(1) * b(1) * p(1) - x1(2) * g(1) + a(1) * x1(3); g(1) * x1(2) - a(1) * x1(3) + (1 - p(1)) * b(1) * x1(1) * x1(2)];
[t1, x1] = ode45(f1, [0 31], IC);
 
f2 = @(t,x2) [-x2(2) * x2(1) * b(2); x2(2) * x2(1) * b(2) * p(2) - x2(2) * g(2) + a(2) * x2(3); g(2) * x2(2) - a(2) * x2(3) + (1 - p(2)) * b(2) * x2(1) * x2(2)];
[t2, x2] = ode45(f2, [0 375], IC);

f3 = @(t,x3) [-x3(2) * x3(1) * b(3); x3(2) * x3(1) * b(3) * p(3) - x3(2) * g(3) + a(3) * x3(3); g(3) * x3(2) - a(3) * x3(3) + (1 - p(3)) * b(3) * x3(1) * x3(2)];
[t3, x3] = ode45(f3, [0 40], IC);

% Plot
hold on

subplot(3,1,1)
plot(t1,x1(:,1:3))
title('The spread of Regina George''s lie')
xlabel('Days'), ylabel('Population')
legend('S','I','R')

ylim([0 1000])
xlim([0 7])

subplot(3,1,2)
plot(t2,x2(:,1:3))
title('The spread of Dr. Neverheardofher''s lie')
xlabel('Days'), ylabel('Population')
legend('S','I','R')

xlim([0 375])

subplot(3,1,3)
plot(t3,x3(:,1:3))
title('The spread of the Conwoman''s lie')
xlabel('Days'), ylabel('Population')
legend('S','I','R')

xlim([0 35])

hold off

exportgraphics(gcf, 'Graphs.jpg')



