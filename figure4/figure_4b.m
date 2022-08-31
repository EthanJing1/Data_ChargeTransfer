%polaron sample dynamics
clear all
close all
 filename=sprintf('Apr1521#01.scanraw_0'); %please change filename manually
% fileinfo=dir;
% filename=strings(length(fileinfo),1);
% for i=1:length(fileinfo)
%     filename(i,1)=fileinfo(i).name;
% end

raw=load(filename);

spec = raw(1:2001,:);

wn=[1:1:2000];

L=length(spec(1,:));

temp1=spec(:,1:2:L);

temp2=spec(:,2:2:L);

data(1:2:L,1:2001)=sortrows(temp1',1);

data(2:2:L,1:2001)=sortrows(temp2',1);

data_1=data';

on_1=data_1(:,2:2:L);

off_1=data_1(:,1:2:L);

time = data_1(1,:);

time = time(:,1:2:L)+21130-180+90540;

on=on_1(2:2001,:);off=off_1(2:2001,:);

off_spec=off(:,10); on_spec=on(:,10);

[M N]=size(on);

pp = on - off;

pp=-pp./off;

new = medfilt2(pp);

bb_2=new(:,70:80);

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

%new_lim=new(:,num:num_2)

% figure;plot(wn,new_2);

figure;plot(-time,dynamic);
 
axis tight;

xlabel('time (fs)','FontSize',12,'FontWeight','bold');ylabel('intensity','FontSize',12,'FontWeight','bold');

%savefig('2.503mW 750-822 galvo#2.fig');

figure;mesh(-time,wn,new);

axis tight;

xlabel('time (fs)','FontSize',12,'FontWeight','bold');ylabel('intensity','FontSize',12,'FontWeight','bold');

% savefig('2D pump power 2.503mW #2 galvo.fig');

% figure;plot(wn,off(:,20),wn,on(:,20));

% axis tight;

% xlabel('wavenumber (cm-1)','FontSize',12,'FontWeight','bold');ylabel('intensity','FontSize',12,'FontWeight','bold');
% savefig('2.503mW pump on pump off galvo.fig');
