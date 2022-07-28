% This code produce the plot fo 1-parameter bifurcation diagram for kg0
% Data was obtained from Mathcont on Matlab


load('Figure4cData.mat')

plot(kgx1(1:indt(1)),xp(1:indt(1)),'b','LineWidth',2)
hold on
plot(kgx1(indt(1)+1:indt(2)),xp(indt(1)+1:indt(2)),'--b','LineWidth',1)
plot(kgx1(indt(2)+1:indt(3)),xp(indt(2)+1:indt(3)),'b','LineWidth',2)
plot(kgx1(indt(3)+1:end),xp(indt(3)+1:end),'--b','LineWidth',1)
hold on
plot(kgx2,xp)
plot(kgx3,xp,'b','LineWidth',2)
hold on
co=lines(3);
plot(SN1(1),xp(ind1(1)),'o','MarkerFaceColor',co(1,:),'MarkerEdgeColor',co(1,:),'MarkerSize',8)
plot(SN1(2),xp(ind1(2)),'o','MarkerFaceColor',co(2,:),'MarkerEdgeColor',co(2,:),'MarkerSize',8)
plot(SN3,xp(ind3),'o','MarkerFaceColor',co(3,:),'MarkerEdgeColor',co(3,:),'MarkerSize',8)

xlim([0 2])
xlabel('kg_0')
ylabel('x_{1}_{ss}')
title('m=2')