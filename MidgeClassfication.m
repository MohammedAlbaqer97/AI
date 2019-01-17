% clc
% clear;
%% *Import Data Set
% x1 = [1 1.72 1.24;1 1.64 1.38;1 1.74 1.36;1 1.70 1.40;1 1.82 1.38;1 1.90...
%     1.38;1 1.82 1.54;1 2.08 1.56];
% x2 = [1 1.78 1.14;1 1.86 1.20;1 1.96 1.30;1 2.00 1.26;1 2.00 1.28;1 1.96...
%     1.18];
X = [ones(length(x1),1) x1(:,1);ones(length(x1),1) x2(:,1)];
Y = [x1(:,2);x2(:,2)];
%% *Logistic Regression*
b = [0;0];
for i =1:1000
    b = b-(0.5/length(X)*X'*(1./(1+exp(-X*b))-Y));
end
keyboard
%% Make pridection
data = [1 6;1 3;1 7];
prd = 1./(1+exp(-data*b));
%% Figure
hold on
scatter(x1(:,2),x1(:,3),'*')
scatter(x2(:,2),x2(:,3),'o')
scatter(data(:,2),data(:,3),'+')
x = 1.6:0.005:2.3;
y = (-b(1)-b(2)*x)/b(3);
plot(x,y)
xlabel('Wing Length (cm)')
ylabel('Antenna Length (cm)')
title('The Midge Classification Problem')
grid
legend('Apf','Af','','des','location','best')
