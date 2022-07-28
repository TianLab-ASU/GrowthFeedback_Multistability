% This code generate the rate curve and bifurcation diagram for the
% self-activation.


%parameter set
k0=0.02; k1=3.6; n=2; K=0.1;%4.4;
d0=0.2; kg0=1; Jd1=1;
tsc=0.1; m=2;


%Plotting the the GR(X) and GR(x)*x
figure('units','normalized','outerposition',[0 0 0.65 1])
subplot(3,2,5)
hold on
fplot(@(x) kg0./(1+(x/Jd1).^m),[0.001 100],'k','linewidth',2)

fplot(@(x) kg0*x./(1+(x/Jd1).^m),[0.001 100],'r','linewidth',2)
ylabel('Rates')
xlabel('x')
xlim([0.000 100])
set(gca,'XScale','log')
legend({'Growth Rate','Dilution Rate'},'Location','northeast')
box on

%Plotting the the GR(X) and f(x)
subplot(3,2,3)
fplot(@(x) tsc*d0*x+kg0*x./(1+(x/Jd1).^m),[0.001 100],'r','linewidth',2)
hold on

fplot(@(x) tsc*k0+tsc*k1*(x).^n./((x).^n+K^n),[0.001 100],'k','linewidth',2)
set(gca,'XScale','log','YScale','log')
ylim([0.00 1.1])
xlim([0.00 100])
ylabel('Rate')
xlabel('x')
legend({'Degradation','Production'},'Location','southeast')




% 1-par bifurcation diagram with respect to kg0

% solving dx/dt=0, with respect to kg_0 we get:
FSA= @(x) -d0*tsc.*(x/Jd1).^m + (k0*tsc/Jd1^m)*(x).^(m-1) - d0*tsc + k0*tsc*x.^(-1) + (k1*tsc*x./(x.^2+K^2)).*(((x/Jd1).^m)+1);

% kg0'
Fn1 = @(x) (-d0*tsc*(m/(Jd1)^(m))*(x).^(m-1.0) + k0*tsc*((m-1)/(Jd1^m))*(x).^(m-2.0) - k0*tsc*x.^(-2.0) +   (k1*tsc*((Jd1^m).*(K - x).*(K + x) + x.^m.*(K^2*(1 + m) + (-1 + m)*x.^2)))./((Jd1^m)*(K^2 + x.^2).^2) );

%Nummerically solving kg0'=0 in order to look for saddle node
xv=0:0.00001:100;

bif=FSA(xv);
bifp=Fn1(xv);

init1 = 0.008;
init2 = 0.1;
init3 = 1;
init4 = 10;
options = optimoptions('fsolve','Display','off','TolFun',1e-14,'TolX',1e-14);

[sol1, fval1,flag1] = fsolve(Fn1,init1,options);
[sol2, fval2,flag2] = fsolve(Fn1,init2,options);
[sol3, fval3,flag3] = fsolve(Fn1,init3,options);
[sol4, fval4,flag4] = fsolve(Fn1,init4,options);

xvf=xv*10000;
pq1=find(xvf==10000*round(sol1,4),1,'first');
pq2=find(xvf==10000*round(sol2,4),1,'first');
pq3=find(xvf==10000*round(sol3,4),1,'first');
pq4=find(xvf==10000*round(sol4,4),1,'first');


%Ploting the 1-par bifurcation diagram with respect to kg0
subplot(3,2,2)
plot(bif(1:pq1),xv(1:pq1),'b',LineWidth=2)
hold on
plot(bif(pq1+1:pq2),xv(pq1+1:pq2),'--b',LineWidth=1)
plot(bif(pq2+1:pq3),xv(pq2+1:pq3),'b',LineWidth=2)
plot(bif(pq3+1:pq4),xv(pq3+1:pq4),'--b',LineWidth=1)
plot(bif(pq4:end),xv(pq4:end),'b',LineWidth=2)

co=lines(4);

plot(bif(pq1),xv(pq1),'o', MarkerFaceColor=co(1,:),MarkerEdgeColor=co(1,:),MarkerSize=8)
plot(bif(pq2),xv(pq2),'o', MarkerFaceColor=co(2,:),MarkerEdgeColor=co(2,:),MarkerSize=8)
plot(bif(pq3),xv(pq3),'o', MarkerFaceColor=co(3,:),MarkerEdgeColor=co(3,:),MarkerSize=8)
plot(bif(pq4),xv(pq4),'o', MarkerFaceColor=co(4,:),MarkerEdgeColor=co(4,:),MarkerSize=8)

text(bif(pq1),xv(pq1),'SN1  ',HorizontalAlignment='right')
text(bif(pq2),xv(pq2),'  SN2')
text(bif(pq3),xv(pq3),'SN3  ',HorizontalAlignment='right')
text(bif(pq4),xv(pq4),'  SN4')

%legend({'','','','','','SN1','SN2','SN3','SN4'})
set(gca,'YScale','log')
xlim([0 2.1])
xlabel('kg_0')
ylabel('x_{ss}')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


subplot(3,2,4)


GRfu =  bif./(1+(xv/Jd1).^m);

plot(bif(1:pq1),GRfu(1:pq1),'b',LineWidth=2)
hold on
plot(bif(pq1+1:pq2),GRfu(pq1+1:pq2),'--b',LineWidth=1)
plot(bif(pq2+1:pq3),GRfu(pq2+1:pq3),'b',LineWidth=2)
plot(bif(pq3+1:pq4),GRfu(pq3+1:pq4),'--b',LineWidth=1)
plot(bif(pq4:end),GRfu(pq4:end),'b',LineWidth=2)

co=lines(4);

plot(bif(pq1),GRfu(pq1),'o', MarkerFaceColor=co(1,:),MarkerEdgeColor=co(1,:),MarkerSize=8)
plot(bif(pq2),GRfu(pq2),'o', MarkerFaceColor=co(2,:),MarkerEdgeColor=co(2,:),MarkerSize=8)
plot(bif(pq3),GRfu(pq3),'o', MarkerFaceColor=co(3,:),MarkerEdgeColor=co(3,:),MarkerSize=8)
plot(bif(pq4),GRfu(pq4),'o', MarkerFaceColor=co(4,:),MarkerEdgeColor=co(4,:),MarkerSize=8)

text(bif(pq1),GRfu(pq1),'SN1  ',HorizontalAlignment='right')
text(bif(pq2),GRfu(pq2),'  SN2')
text(bif(pq3),GRfu(pq3),'SN3  ',HorizontalAlignment='right')
text(bif(pq4),GRfu(pq4),'  SN4')

set(gca,'YScale','linear')
xlim([0 2.1])
ylim([0 2.1])
xlabel('kg_0')
ylabel('GR')








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% m-kg0  2-par bifurcation diagram, data were obtained from Oscill8
load('fig2_data2par.mat')

subplot(3,2,6)

pro = zeros(1,length(solF1));
prof = 6*ones(1,length(solF2));
solF3p = solF3(~isnan(solF3));
solF4p = solF4(~isnan(solF4));
mv3= mv(~isnan(solF3));
mv4= mv(~isnan(solF4));
al=0.1;

%Coloring regions 
hold all
fill([pro fliplr(solF1')], [mv fliplr(mv)],'w',FaceAlpha=al,EdgeColor='none');
fill([solF2' fliplr(prof)], [mv fliplr(mv)],'w',FaceAlpha=al,EdgeColor='none');
fill([solF1' fliplr(solF2')], [mv fliplr(mv)],'r',FaceAlpha=al,EdgeColor='none');
fill([solF3p' fliplr(solF4p')], [mv3 fliplr(mv4)],'g',FaceAlpha=al,EdgeColor='none');

p1=fill([nan nan], [nan nan],'w',FaceAlpha=al);
p2=fill([nan nan], [nan nan],'r',FaceAlpha=al);
p3=fill([nan nan], [nan nan],'g',FaceAlpha=al);
p4=fill([nan nan], [nan nan],[1,1,0],FaceAlpha=al);

%Plotting 
plot(solF1,mv',Color=co(1,:),LineWidth=2)
plot(solF2,mv',Color=co(2,:),LineWidth=2)
plot(solF3,mv',Color=co(3,:),LineWidth=2)
plot(solF4,mv',Color=co(4,:),LineWidth=2)
plot([0 2.1],[2 2],'k--','LineWidth',1.5)
hold off
legend([p1; p2; p3],{'Monostable', 'Circuit Bistability', 'Growth-feedback Bistability'},'Location','best');
text(1.1,2.3,'Tristable',HorizontalAlignment='center')
xlim([0 2.1])
ylim([1 2.5])
box on
xlabel('kg_0')
ylabel('m')
