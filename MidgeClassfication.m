clc
clear
%% Import Data Set
x1 = [1 1.72 1.24;1 1.64 1.38;1 1.74 1.36;1 1.70 1.40;1 ...
1.82 1.38;1 1.90 1.38;1 1.82 1.54;1 2.08 1.56];
x2 = [1 1.78 1.14;1 1.86 1.20;1 1.96 1.30;1 2.00 1.26;1 ...
2.00 1.28;1 1.96 1.18];
X = [x1;x2];
Y = [zeros(length(x1),1)+1;zeros(length(x2),1)];
%% *Logistic Regression*
theta = [0;0;0];
for i =1:1000
theta = theta-(0.5/length(X)*X'*(1./(1+exp(-X*theta))-Y));
end
%% Make pridection
data = [1 1.8 1.24;1 1.84 1.28;1 2.04 1.4];
prd = 1./(1+exp(-data(2)*theta));
%% Figure
hold on
scatter(x1(:,2),x1(:,3),'*')
scatter(x2(:,2),x2(:,3),'o')
scatter(data(:,2),data(:,3),'+')
x = 1.6:0.005:2.3;
y = (-theta(1)-theta(2)*x)/theta(3);
plot(x,y)
xlabel('Wing Length (cm)')
ylabel('Antenna Length (cm)')
title('Decision Boundary')
grid
legend('Apf','Af','','des','location','best')
