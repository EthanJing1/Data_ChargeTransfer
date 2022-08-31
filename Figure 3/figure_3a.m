%%Pseudo color 2D tr-VSFG spectrum.
%A negative signal is observed at t = 0, 
%which recovers quickly and remains as a bleach signal at t>0. 
%Top: integrated tr-VSFG signal. Right: Linear VSFG spectrum.
%the psedo color 2D spectrum is average over 15 scans
clear all;
close all;

raw=load('Aug3021#01.scanraw_0');

load wn.mat;

load spectrum.mat;

spec = raw(1:2001,:);

L=length(spec(1,:));

temp1=spec(:,1:2:L);

temp2=spec(:,2:2:L);

data(1:2:L,1:2001)=sortrows(temp1',1);

data(2:2:L,1:2001)=sortrows(temp2',1);

data_1=data';

on_1=data_1(:,2:2:L);

off_1=data_1(:,1:2:L);

time = data_1(1,:);

time = time(:,1:2:L)+21130;

on=on_1(2:2001,:);off=off_1(2:2001,:);

wn=wn-80;

off_spec=off(:,10); on_spec=on(:,10);

[M N]=size(on);

pp = on - off;

pp=-pp./off;

new = medfilt2(pp);

bb_2=new(:,170:180);

bg=mean(bb_2,2);

bg_1=repmat(bg,1,N);

new=new-bg_1;

num=find(time==2500);

num_2=find(time==-4000);

dynamic = sum(new(800:1200,:));

dynamic_lim=dynamic(:,num:num_2);

time_lim=time(:,num:num_2);

new_1=new(:,20:21);

new_2=sum(new_1,2);


figure;plot(-time,dynamic); % Tr-VSFG dynamics
 
axis tight;

xlabel('time (fs)','FontSize',12,'FontWeight','bold');ylabel('intensity','FontSize',12,'FontWeight','bold');

figure;mesh(-time,wn,new);% Pseudo color 2D tr-VSFG spectrum

axis tight;

ylim([-3200 -2600]);

xlabel('time (fs)','FontSize',12,'FontWeight','bold');ylabel('wavenumber','FontSize',12,'FontWeight','bold');

figure;plot(wn,spectrum); %Linear VSFG spectrum

axis tight;

xlabel('wavenumber','FontSize',12,'FontWeight','bold');
