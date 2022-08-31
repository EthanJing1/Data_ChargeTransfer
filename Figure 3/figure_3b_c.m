%%global analysis result, Figure 3b/c. 
%spectral component(figure.3b)
%wn is x-axis data, unit(wavenumber cm-1),sp_1,sp_2 and sp_3 are S1.S2 and S3 shown in the main
%text
clear all
close all
load('figure3b_c_data.mat');
figure;
plot(wn,sp_1);
hold on
plot(wn,sp_2);
plot(wn,sp_3);
axis tight
legend('S1','S2','S3')
%dynamic component (figure.3a)
%time is x-axis data, unit(time(fs)),dy_1,dy_2 and dy_3 are S1,S2 and S3
%dynamics shown in the main text.
figure;
plot(-time,dy_1);
hold on
plot(-time,dy_2);
plot(-time,dy_3);
axis tight
legend('S1','S2','S3')