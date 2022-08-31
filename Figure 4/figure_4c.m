%polaron sample dynamics(figure 4c)
%Sep2121#02.scanraw_0 is polaron sample shown in the main text. 
filename=sprintf('Sep2121#02.scanraw_0');
    
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

time = time(:,1:2:L)+21130-180;

time=time*1.5;

on=on_1(2:2001,:);off=off_1(2:2001,:);

off_spec=off(:,10); on_spec=on(:,10);

[M N]=size(on);

pp = on - off;

pp=pp./off;

new = medfilt2(pp);

bb_2=new(:,110:120);

bg=mean(bb_2,2);

bg_1=repmat(bg,1,N);

new=new-bg_1;

num=find(time==2500);

num_2=find(time==-4000);

dynamic = sum(new(600:1200,:));

dynamic_lim=dynamic(:,num:num_2);

time_lim=time(:,num:num_2);

new_1=new(:,20:21);

new_2=sum(new_1,2);

figure;plot(-time,dynamic);
 
axis tight;

xlabel('time (fs)','FontSize',12,'FontWeight','bold');ylabel('intensity','FontSize',12,'FontWeight','bold');
