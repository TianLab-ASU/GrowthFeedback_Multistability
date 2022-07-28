
clear

figure(40)
% subplot(1,2,2)

for i=1:6
clearvars -except i
    data= string(i) + ".mat"; 
load(data)
x1=x(1,:);
x2=x(2,:);
p1=x(3,:);
eiggg=sum(sign(f(2,:)));
hold on
if eiggg<0
plot(p1,x1,'b',LineWidth=2)
plot(p1,x2,'b',LineWidth=2)
elseif eiggg>0
plot(p1,x1,'b--',LineWidth=1)
plot(p1,x2,'b--',LineWidth=1)

end

end

box on
        xlim([1.5 2.5])
                ylim([0 20])

        xlabel('k_{1,1}')
        ylabel('x_{1}_{ss}')