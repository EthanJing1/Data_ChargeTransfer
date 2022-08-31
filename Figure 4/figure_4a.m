%% this code is used for plotting Power dependence on Tr-VSFG dynamics.
%the pump_power is recording by ophis thermal power meter;
%t_zero_new is delta SFG intensity, SFG signal was dispersed by a 
%spectrograph (Shamrock, Andor) and detected by a 
%charge coupled device (Newton idus, Andor).
load data_4a;
figure;
scatter(pump_power,t_zero_new);
xlabel('pump power(mW)');
ylabel('delta SFG(%)')