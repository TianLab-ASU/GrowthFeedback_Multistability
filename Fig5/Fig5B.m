% This code produce the plot fo 1-parameter bifurcation diagram for kg0
% Data was obtained from Mathcont on Matlab

load('Fig5B.mat')

plot(kgx1(1:indto(1)),xp(1:indto(1)),'b','LineWidth',2)
hold on
plot(kgx1(indto(1)+1:indto(3)),xp(indto(1)+1:indto(3)),'--b','LineWidth',1)
plot(kgx1(indto(3)+1:indto(4)),xp(indto(3)+1:indto(4)),'b','LineWidth',2)
plot(kgx1(indto(3)+1:end),xp(indto(3)+1:end),'--b','LineWidth',1)
hold on
plot(kgx3(1:indto(2)),xp(1:indto(2)),'b','LineWidth',2)
plot(kgx3(indto(2)+1:indto(4)),xp(indto(2)+1:indto(4)),'--b','LineWidth',1)
plot(kgx3(indto(4)+1:indto(5)),xp(indto(4)+1:indto(5)),'--b','LineWidth',1)
plot(kgx3(indto(5)+1:end),xp(indto(5)+1:end),'b','LineWidth',2)


hold on
co=lines(5);
plot(SN1(1),xp(ind1(1)),'o','MarkerFaceColor',co(1,:),'MarkerEdgeColor',co(1,:),'MarkerSize',8)
plot(SN1(2),xp(ind1(2)),'o','MarkerFaceColor',co(2,:),'MarkerEdgeColor',co(2,:),'MarkerSize',8)
plot(SN3(1),xp(ind3(1)),'o','MarkerFaceColor',co(4,:),'MarkerEdgeColor',co(4,:),'MarkerSize',8)
plot(SN3(2),xp(ind3(2)),'o','MarkerFaceColor',co(3,:),'MarkerEdgeColor',co(3,:),'MarkerSize',8)
plot(SN3(3),xp(ind3(3)),'o','MarkerFaceColor',co(5,:),'MarkerEdgeColor',co(5,:),'MarkerSize',8)
xlim([0 2])
xlabel('kg_0')
ylabel('x_{1}_{ss}')
title('m=2')