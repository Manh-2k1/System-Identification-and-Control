clc;
close all;
l1=1;
l2=1;
m1=1;
m2=1;
g=9.81;
syms lc1 lc2 J1 J2;
%% LAY CAC THONG SO
the1_d=theta1_d.signals.values;
the2_d=theta2_d.signals.values;
the1_dd=theta1_dd.signals.values;
the2_dd=theta2_dd.signals.values;
phi=zeros(2,5);
tor=[0;0];
%% TINH TOAN CAC HAM COS,SIN CÓ TRONG DONG LUC HOC
for i=1:length(theta1_d.time)
    tr2=tor2.signals.values(i,1);
    tr1=tor1.signals.values(i,1);
    the1=theta1.signals.values(i,1);
    the2=theta2.signals.values(i,1);
    gama=[the1_dd(i,1),  the1_dd(i,1)+the2_dd(i,1),                   (2*cos(the2)*the1_dd(i,1)+cos(the2)*the2_dd(i,1)-sin(the2)*(2*the2_d(i,1)*the1_d(i,1)+the2_d(i,1)^2)),      cos(the1),      cos(the1+the2);
          0 ,            the1_dd(i,1)+the2_dd(i,1),                    cos(the2)*the1_dd(i,1)+sin(the2)*the1_d(i,1)*the1_d(i,1),                                                    0,            cos(the1+the2);]; 
    phi=[phi;gama];
    T=[tr1;tr2];
    tor=[tor;T]; 
end
%%
p=pinv(phi'*phi)*phi'*tor;
lc2=p(5)/(g*m2)
J2=p(2)-m2*(lc2^2)
lc1=(p(4)-m2*g*l1)/(m1*g)
J1=p(1)-m1*(lc1^2)-m2*(l1^2)
thongso=[J1,J2,lc1,lc2];