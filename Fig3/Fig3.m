% This code generate the 2-par bifurcartion diagram using data obtained from MathCont


for ind=1:9

%loading data 
clearvars -except ind
load ("Fig3_data"+ string(ind) + ".mat")

%plotting 
subplot(npv3,npv2,j+(j2-1)*npv3)
plot(SN1,pv,'LineWidth',2)
hold on
plot(SN2,pv,'LineWidth',2)
plot(SN3,pv,'LineWidth',2)
plot(SN4,pv,'LineWidth',2)

title("K = " + K + ", n = " + n)
xlim([0 2.1])
ylim([1 2.5])
xlabel('kg_0')
ylabel('m')

end