%% this code is used for plotting Power dependence on Tr-VSFG dynamics.
%the pump_power is recording by ophis thermal power meter;
%t_zero_new is delta SFG intensity, SFG signal was dispersed by a 
%spectrograph (Shamrock, Andor) and detected by a 
%charge coupled device (Newton idus, Andor).
pump_power = [0.0101 0.303 0.595 0.935 1.217 1.566 1.702 1.969 2.456 2.92 3.43 4.01 4.59 5.12];

t_zero_new = [0.0337184005911352;-0.150807080413491;-0.278076118328974;-0.552863727517315;-0.615383773812426;-1.09673002436311;-1.03644063417258;-1.07254779082297;-1.59571822292499;-1.61596099140463;-1.87134555481299;-2.39906499414149;-2.72855186501972;-2.68883064980135];
figure;
scatter(pump_power,t_zero_new);
xlabel('pump power(mW)');
ylabel('delta SFG(%)')