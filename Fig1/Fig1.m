% close all
%%%Manually set the rendering to "painter" and export it for .svg
clc
clear
close
% parameter Set 1
k0=4;
d0=0.03; kg0=0.9; Jd1=1;
tsc=0.05;



mv=1:0.01:2; %m-vector

ColorSet = jet(length(mv)); %Colors for the colormap


%f(x) and d(x)
subplot(3,2,3)
set(gca, 'ColorOrder', ColorSet);
hold on
fplot(@(x) tsc*d0*x+kg0*x./(1+(x/Jd1).^mv),[0.000 1000],'linewidth',2)
p5=fplot(@(x) tsc*d0*x,[0.000 1000],'-.k','linewidth',2);


subplot(3,2,5)
set(gca, 'ColorOrder', ColorSet);
hold on
fplot(@(x) kg0./(1+(x/Jd1).^mv),[0.001 1000],'linewidth',2)



subplot(3,2,3)
hold on
p1 = plot(NaN,NaN,'k','LineWidth',2);
p2 = fplot(@(x) tsc*d0*x+kg0*x,[0.001 1000],'k:','linewidth',2);
%p3 = fplot(@(x) tsc*k0,[0.000 1000],'k--','linewidth',2);
p3  = yline(tsc*k0, '--', 'LineWidth',2);
set(gca,'XScale','log','YScale','log')
ylim([0.05 10.1])
xlim([0.05 1000])
ylabel('Rate')
xlabel('x')

legend([p1; p2; p5; p3],{'Degradation + Dilution', 'Degradation + Max Dilution', 'Degradation','Production'},'Location','best');
box on
mp=1:0.25:2;

cbh = colorbar ; %Create Colorbar
cbh.Ticks = (mp-min(mp)) ; %Create ticks 
cbh.TickLabels = mp ;    %Replace the labels of these ticks  
cbh.Title;
cbh.Title.String = "m value";


subplot(3,2,5)
ylabel(' Growth Rate')
xlabel('x')
xlim([0.05 1000])
set(gca,'XScale','log')
box on
set(gcf, 'Colormap', ColorSet);

cbh = colorbar ; %Create Colorbar
cbh.Ticks = (mp-min(mp)) ; %Create ticks 
cbh.TickLabels = mp ;    %Replace the labels of these ticks 
cbh.Title;
cbh.Title.String = "m value";


% fitting
subplot(3,2,2)

run figcurvefitting.m

% 
k0=2;
d0=0.03; kg0=1; Jd1=1; 
tsc=0.05; 
m=2;


% Bifurcation Diagram 
% kg0(x)
FSA= @(x) -d0*tsc.*(x/Jd1).^m + (k0*tsc/Jd1^m)*(x).^(m-1) - d0*tsc + k0*tsc*x.^(-1) ;
% kg0'(x)
Fn1 = @(x) (-d0*tsc*(m/(Jd1)^(m))*(x).^(m-1.0) + k0*tsc*((m-1)/(Jd1^m))*(x).^(m-2.0) - k0*tsc*x.^(-2.0) );

xv=0:0.00001:100;

bif=FSA(xv);
bifp=Fn1(xv);

   init1 = 0.1;
   init2 = 45;

options = optimoptions('fsolve','Display','off','TolFun',1e-14,'TolX',1e-14);

% Solution of kg0'(x)=0. For the bifurcation point calculation
[sol1, fval1,flag1] = fsolve(Fn1,init1,options);
[sol2, fval2,flag2] = fsolve(Fn1,init2,options);


xvf=xv*10000;
pq1=find(xvf==10000*round(sol1,4),1,'first');
pq2=find(xvf==10000*round(sol2,4),1,'first');


% Plotting
subplot(3,2,4)
plot(bif(1:pq1),xv(1:pq1),'Color',[0,0,1],LineWidth=2)
hold on
plot(bif(pq1+1:pq2),xv(pq1+1:pq2),'--','Color',[0,0,1],LineWidth=1)
plot(bif(pq2+1:end),xv(pq2+1:end),'Color',[0,0,1],LineWidth=2)


co=lines(2);

plot(bif(pq1),xv(pq1),'o', MarkerFaceColor=co(1,:),MarkerEdgeColor=co(1,:),MarkerSize=8)
plot(bif(pq2),xv(pq2),'o', MarkerFaceColor=co(2,:),MarkerEdgeColor=co(2,:),MarkerSize=8)


text(bif(pq1),xv(pq1),'  SN1',HorizontalAlignment='left')
text(bif(pq2),xv(pq2),'  SN2')


%legend({'','','','','','SN1','SN2','SN3','SN4'})
set(gca,'YScale','log')
xlim([0 2.1])
xlabel('kg_0')
ylabel('x_{ss}')




load('Fig1data.mat') % data obtain from Oscill8 using 





subplot(3,2,6)
plot(solF1,mv',Color=co(1,:),LineWidth=2)
hold on
plot(solF2,mv',Color=co(2,:),LineWidth=2)
plot([0 2.1],[2 2],'k--','LineWidth',1.5)
text(1,2.25,'Bistable',HorizontalAlignment='center')
text(1,1.5,'Monostable',HorizontalAlignment='center')


xlim([0 2.1])
ylim([1 2.5])
xlabel('kg_0')
ylabel('m')

