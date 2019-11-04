%Write a new test code, NonminimalPrism4.m, for a non minimal tensegrity
%prism with 4 bars as shown in Figure 3.43 of Bob?s book, but with 4 bars
%(all nodal points are taken as free nodes Q_i in this design).
clc; clear all; clf; close all; 


q = 8; %free nodes
p = 0; %fixed nodes
n = q+p;

b = 4; %Bar elements
s = 24; %String elements
m = b + s; %members

P = zeros(1,p);
Q(1,2) = 1; Q(1,3) = 1;
Q(2,3) = 1; Q(2,4) = 1;
Q(3,5) = 1; Q(3,6) = 1;
Q(1,6) = 1; Q(1,7) = 1;
Q(2,7) = 1; Q(3,7) = 1;
Q(2,8) = 1; Q(3,8) = 1;

%plotting bars & strings
C(1,7) = 1; C(1,1) = -1;
C(2,6) = 1; C(2,4) = -1;
C(3,5) = 1; C(3,3) = -1;
C(4,8) = 1;C(4,2) = -1;
C(5,2) = 1;C(5,1) = -1;
C(6,3) = 1;C(6,2) = -1;
C(7,4) = 1;C(7,3) = -1;
C(8,1) = 1;C(8,4) = -1;
C(13,6) = 1; C(13,5) = -1;
C(14,7) = 1; C(14,6) = -1;
C(15,8) = 1; C(15,7) = -1;
C(16,8) = 1; C(16,5) = -1;
C(17,6) = 1; C(17,1) = -1;
C(18,5) = 1; C(18,2) = -1;
C(19,7) = 1; C(19,2) = -1;
C(20,6) =1; C(20,3) = -1;
C(21,8)=1; C(21,3) = -1;
C(22,7) = 1; C(22,4) = -1;
C(23,5) = 1;C(23,4) = -1;
C(24,8) = 1;C(24,1) = -1; 
C(25,3) = 1;C(25,1) = -1;
C(26,4) = 1;C(26,2) = -1;
C(27,7) = 1;C(27,5) = 1;
C(28,8) =1; C(28,6) = -1;

dim=3;

[c_bars,t_strings,V] = tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,2.0); 
set(get(gca, 'title'), 'string', 'Nonminimal Prism')
set(get(gca, 'xlabel'), 'string', 'x')
set(get(gca, 'ylabel'), 'string', 'y')