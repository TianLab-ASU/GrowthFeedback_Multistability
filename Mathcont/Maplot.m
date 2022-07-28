%plotting the 2par bifurcation data from matcont version 2

nfil=5; %number of file on the folder

for i=1:nfil
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
elseif eiggg>0
plot(p1,x1,'b--',LineWidth=1)
end

end


        xlim([0 2])
                ylim([0 20])

        xlabel('kg_0')
        ylabel('x_{1}_{ss}')