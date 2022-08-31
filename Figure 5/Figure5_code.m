%%Figure 5
%In this section, the figure is figure 5a.
%the fitting result is not plotted out
%spec and dyn is generated through global analysis;
%spec is spectral component,dyn is dynamic component
clear all;close all;
load('Figure5_data.mat')
com_1=spec1(:,2).*dyn1(:,2)';
com_2=spec1(:,4).*dyn1(:,4)';

com_3=spec2(:,2).*dyn2(:,2)';
com_4=spec2(:,4).*dyn2(:,4)';

com_5=spec3(:,2).*dyn3(:,2)';
com_6=spec3(:,4).*dyn3(:,4)';

com_7=spec4(:,2).*dyn4(:,2)';
com_8=spec4(:,4).*dyn4(:,4)';

sim_1=com_1+com_2;
sim_2=com_3+com_4;
sim_3=com_5+com_6;
sim_4=com_7+com_8;
% figure;
% mesh(sim);
sim_1 = sum(sim_1(600:1200,:));
sim_2 = sum(sim_2(600:1200,:));
sim_3 = sum(sim_3(600:1200,:));
sim_4 = sum(sim_4(600:1200,:));
dynamics=[dynamic_1;dynamic_2;dynamic_3;dynamic_4]';
sim=[sim_1;sim_2;sim_3;sim_4]';
figure;
% plot(-time_lim,dynamic);
plot(-time_lim,dynamic_1,-time_lim,dynamic_2,-time_lim,dynamic_3,-time_lim,dynamic_4);
legend('1.002mW','1.489mW','2.095mW','2.503mW');
title('raw dynamics')
xlabel('time / fs'); ylabel('intensity')
%% FIGURE 5b/c 
%time_lim is x-axis data, y-axis is coefficient from global analysis.
%here we only plot out the dynamic part
figure;
plot(-time_lim,dyn3(:,2));
hold on
plot(-time_lim,dyn1(:,2));
plot(-time_lim,dyn4(:,2));
plot(-time_lim,dyn2(:,2));
legend('1.002mW','1.489mW','2.095mW','2.503mW');
title ('dynamics of component 2')
xlabel('time / fs'); ylabel('intensity')
figure;
plot(-time_lim,dyn1(:,4));
hold on
plot(-time_lim,dyn2(:,4));
plot(-time_lim,dyn3(:,4));
plot(-time_lim,dyn4(:,4));
legend('1.002mW','1.489mW','2.095mW','2.503mW');
title ('dynamics of component 3')
xlabel('time / fs'); ylabel('intensity')
%% figure 5b/c insert
%lifetime_com is obtain by Global Analysis; pp_power is measured by Ophis
%power meter;
load lifetime
% pp_power=[1.002 1.489 2.095 2.503];
% lifetime_com2=[0.71 0.92 0.68 0.87];
% lifetime_com3=[65 38 30 27];
figure;
plot(pp_power,lifetime_com2);
hold on 
scatter(pp_power,lifetime_com2);
title ('lifetime vs pump power, component 2')
xlabel('pump power/ mW'); ylabel('lifetime / ps')
figure;
plot(pp_power,lifetime_com3);
hold on
scatter(pp_power,lifetime_com3);
title ('lifetime vs pump power, component 3')
xlabel('pump power/ mW'); ylabel('lifetime / ps')