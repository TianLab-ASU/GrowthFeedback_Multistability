% This code generate the nullcline for the toggle siwtch circuit ODE system  

% parameter set for Fig 5A

k0x=0.01; k1x=2; Kx=3; d0x=0.1;

k0y=k0x; k1y=k1x; Ky=Kx; d0y=d0x; 

n2=2; tsc=0.1; Jd1=1; n=2; kg=0.95;


%Defining variable values
yp = 20:-0.01:0;
y = repmat(yp',1,length(yp));


xp = 0:0.01:20;
x = repmat(xp,length(xp),1);

dx=1;
yq = 20.01:-dx:0.01;
yq1 = repmat(yq',1,length(yq));


xq = 0.01:dx:20.01;
xq1 = repmat(xq,length(xq),1);



m=2;
% Defining dx/dt and dy/dt
zx =  k0x*tsc + k1x*tsc*Kx^n./(y.^n+Kx^n) - d0x*tsc*x - kg*x./(1+((x+y)/Jd1).^m);
zy =  k0y*tsc + k1y*tsc*Ky^n./(x.^n+Ky^n) - d0y*tsc*y - kg*y./(1+((x+y)/Jd1).^m);

%plotting nullcline using contour plot 
contour(xp,yp,zx,[0 0],'b',LineWidth=2)
hold on
contour(xp,yp,zy,[0 0],'r',LineWidth=2)


zxq =  k0x*tsc + k1x*tsc*Kx^n./(yq1.^n+Kx^n) - d0x*tsc*xq1 - kg*xq1./(1+((xq1+yq1)/Jd1).^m);
zyq =  k0y*tsc + k1y*tsc*Ky^n./(xq1.^n+Ky^n) - d0y*tsc*yq1 - kg*yq1./(1+((xq1+yq1)/Jd1).^m);

zxqn=zxq./sqrt(zxq.^2+zyq.^2);
 zyqn=zyq./sqrt(zxq.^2+zyq.^2);


% Directional field calculation and plotting
q=quiver(xq,yq,zxqn,zyqn,'k');
 q.AutoScaleFactor = 0.3;


title("m="+ m + "")
xlim([0 15])
ylim([0 15])

xlabel('x_1')
set(gca,'YDir','normal')
legend('dx_1/dt=0','dx_2/dt=0')
ylabel('x_2')



