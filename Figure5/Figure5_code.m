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
for i=1:4;
figure;
plot(-time_lim,dynamics(:,i));
hold on
plot(-time_lim,sim(:,i));
figure;
plot(-time_lim,dynamic_1,-time_lim,dynamic_2,-time_lim,dynamic_3,-time_lim,dynamic_4);
end
%%
figure;
plot(-time_lim,dyn3(:,2));
hold on
plot(-time_lim,dyn1(:,2));
plot(-time_lim,dyn4(:,2));
plot(-time_lim,dyn2(:,2));
legend('1.002mW','1.489mW','2.095mW','2.503mW');
figure;
plot(-time_lim,dyn1(:,4));
hold on
plot(-time_lim,dyn2(:,4));
plot(-time_lim,dyn3(:,4));
plot(-time_lim,dyn4(:,4));
legend('1.002mW','1.489mW','2.095mW','2.503mW');
%%
figure;
plot(pp_power,lifetime_com2);
hold on 
scatter(pp_power,lifetime_com2);
ylim([0 1400])
figure;
plot(pp_power,lifetime_com3);
hold on
scatter(pp_power,lifetime_com3);