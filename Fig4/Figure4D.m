% This code generate the 2-par bifurcartion diagram using data obtained from MathCont

load('Figure4D.mat')

plot(SNtv(:,[1:3]),mv,'LineWidth',2)
xlim([0,2])
xlabel('kg_0')
ylabel('m')
