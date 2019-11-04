%% Test Code for MitchelTruss Order 4
%MitchelTruss4.m, for a Michell Truss of order 4 given as Figure 4.6 In the
%pdf of Bob?s book (note that the nodal points on the circle at the left 
%are taken as fixed nodes P_i, whereas all other nodal points are taken as
%free nodes Q_i). 
clc; clear all; clf; close all; format compact

phi = pi/8;
beta = pi/6;

a = sin(beta)/sin(beta+phi);
c = sin(phi)/sin(beta+phi);
q = 10;
p = 5;
n = q+p;
order = 4;
free_node = ((order+1)*order)/2; %Free nodes total is 10
fix_node = order + 1; %Total fixed nodes
tnodes = free_node + fix_node;
r=1;
r(1) = r;

for j = 1:order
    r(j+1) = a*r(j);
end

for i = 0:4
    for k = 0:4
        phase(i+1,k+1) = (i-k)*phi; 
    end
    k=k-1;
end

%Blue
for j = 1:5
    Q(1:2, j) = [r(j) * cos(phase(1,j)); r(j) * sin(phase(1,j))];
end
%Green
Q(3:4,1) = [r(2)*cos(phase(2,1)); r(2)*sin(phase(2,1))];
Q(3:4,2) = [r(3)*cos(phase(2,2)); r(3)*sin(phase(2,2))];
Q(3:4,3) = [r(4)*cos(phase(2,3)); r(4)*sin(phase(2,3))];
Q(3:4,4) = [r(5)*cos(phase(2,4)); r(5)*sin(phase(2,4))];

Q(13:14,1) = [r(2)*cos(phase(2,1)); -r(2)*sin(phase(2,1))];
Q(13:14,2) = [r(3)*cos(phase(2,2)); -r(3)*sin(phase(2,2))];
Q(13:14,3) = [r(4)*cos(phase(2,3)); -r(4)*sin(phase(2,3))];
Q(13:14,4) = [r(5)*cos(phase(2,4)); -r(5)*sin(phase(2,4))];

%Red
Q(5:6,1) = [r(3)*cos(phase(3,1)); r(3)*sin(phase(3,1))];
Q(5:6,2) = [r(4)*cos(phase(3,2)); r(4)*sin(phase(3,2))];
Q(5:6,3) = [r(5)*cos(phase(3,3)); r(5)*sin(phase(3,3))];

Q(15:16,1) = [r(3)*cos(phase(3,1)); -r(3)*sin(phase(3,1))];
Q(15:16,2) = [r(4)*cos(phase(3,2)); -r(4)*sin(phase(3,2))];
Q(15:16,3) = [r(5)*cos(phase(3,3)); -r(5)*sin(phase(3,3))];

%Black
Q(7:8,1) = [r(4)*cos(phase(4,1)); r(4)*sin(phase(4,1))];
Q(7:8,2) = [r(5)*cos(phase(4,2)); r(5)*sin(phase(4,2))];

Q(17:18,1) = [r(4)*cos(phase(4,1)); -r(4)*sin(phase(4,1))];
Q(17:18,2) = [r(5)*cos(phase(4,2)); -r(5)*sin(phase(4,2))];

%Magenta
Q(9:10,1) = [r(5)*cos(phase(5,1)); r(5)*sin(phase(5,1))];

Q(19:20,1) = [r(5)*cos(phase(5,1)); -r(5)*sin(phase(5,1))];

for j = 1:5
    Q(11:12, j) = [r(j) * cos(phase(1,j)); -r(j) * sin(phase(1,j))];
end
P=[];

[dim,q]=size(Q);
p=size(P,2); 
n=q+p; 

C(1,1) = 1; 



% figure(1)
% plot(Q(1,:), Q(2,:),'-ob',Q(11,:), Q(12,:),'-ob','LineWidth',1.5);
% hold on 
% plot(Q(3,1:4),Q(4,1:4),'-og',Q(13,1:4),Q(14,1:4),'-og','LineWidth',1.5)
% hold on 
% plot(Q(5,1:3),Q(6,1:3),'-or',Q(15,1:3),Q(16,1:3),'-or','LineWidth',1.5)
% hold on 
% plot(Q(7,1:2),Q(8,1:2),'-ok',Q(17,1:2),Q(18,1:2),'-ok','LineWidth',1.5)
% hold on 
% plot(Q(9,1),Q(10,1),'-om',Q(19,1),Q(20,1),'-om','LineWidth',1.5)
% hold on 
% axis equal
% title('Mitchell Truss Order 4')
% grid on

%xlim([0 1]);
%ylim([-1 1]);

%scatter(Q(1,:), Q(2,:));






