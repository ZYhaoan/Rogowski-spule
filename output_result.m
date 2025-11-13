%Rogowskicoil_Auswertung.m
%Yan Zhao, 17.10.2025
clear;

data1=readmatrix("C1--rogowski1-00000--00000.csv","NumHeaderLines",5);
data2=readmatrix("C2--rogowski1-00000--00000.csv","NumHeaderLines",5);
data3=readmatrix("C3--rogowski1-00000--00000.csv","NumHeaderLines",5);
data4=readmatrix("F1--rogowski1-00000--00000.csv","NumHeaderLines",5);
data5=readmatrix("C1--rogowski-neu1--00000.csv","NumHeaderLines",5);
data6=readmatrix("C3--rogowski-neu1--00000.csv","NumHeaderLines",5);
data7=readmatrix("C4--rogowski-neu1--L00000--00000.csv","NumHeaderLines",5);
data8=readmatrix("C1--rogowski-neu2-ohne-00000--00000.csv","NumHeaderLines",5);



% x_achse
time1=data1(:,1);
time2=data2(:,1);
time3=data3(:,1);
time4=data4(:,1);
time5=data5(:,1);
time6=data6(:,1);
time7=data7(:,1);
time8=data8(:,1);


%y_achse d.h. Voltage(current)
I1=data1(:,2);
I2=data2(:,2);
I3=data3(:,2);
I4=data4(:,2);
I5=data5(:,2);
I6=data6(:,2);
I7=data7(:,2);
I8=data8(:,2);


% plot
figure
subplot(4,1,1);
plot(time1,I1);
title('aus Stromzange');

subplot(4,1,2);
plot(time2,I2);
title('aus selbst Rogo');

subplot(4,1,3);
plot(time3,I3);
title('aus Halbleiter 10Vdc+/dc-');

subplot(4,1,4);
plot(time4,I4);
title('aus 2 eres');

xlabel('Time');ylabel('Strom');

figure
plot(time5,I5+1.6,":",'DisplayName','Rogowski coil_p_c_b neu1','Color','b');

hold on
plot(time6+5e-6,I6-0.15,'DisplayName','aus Stromzange');
plot(time3+5.5e-6,I3,'DisplayName','aus Primary current');
xlabel('Time');ylabel('Strom');

hold off
legend

figure
plot(time2+5e-6,I2*20+0.2,'DisplayName','Rogowski coil_p_c_b 1, N=49','Color','g');
hold on
plot(time6+5e-6,I6-0.15,'DisplayName','aus Stromzange');
plot(time3+5.5e-6,I3,'DisplayName','aus Primary current');
xlabel('Time');ylabel('Strom');
hold off
legend

figure
plot(time5+5.5e-6,I5/3.1+0.5,":",'DisplayName','Rogowski coil_p_c_b neu1, N=36','Color','b');%72

figure
plot(time7,I7);
hold on
plot(time8,I8);
hold off 




Rsh = 5;            % shunt resistance (ohm)
Rcoil = 1.5;           % coil DC resistance (ohm)
Rtot = Rsh + Rcoil;

I = I7/Rsh;          % current waveform (A)

i=0.632*0.15;
x_target=interp1(time7,I+0.3,i);
%plot(time7,I+0.3);
