%%global analysis result
%spectral component
figure;
plot(wn,sp_1);
hold on
plot(wn,sp_2);
plot(wn,sp_3);
axis tight
%dynamic component
figure;
plot(-time,dy_1);
hold on
plot(-time,dy_2);
plot(-time,dy_3);
axis tight