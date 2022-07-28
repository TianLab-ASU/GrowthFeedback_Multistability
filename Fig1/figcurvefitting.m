 %Data from Scott M, Gunderson CW, Mateescu EM, Zhang Z, Hwa T. 
 % Interdependence of Cell Growth and Gene Expression:
 % Origins and Consequences. Science. 2010 Nov 19;330(6007):1099–102.
 %Data was collected using Matlab https://www.mathworks.com/products/curvefitting.html
 % Load "fig4curvefitting.sfit" on curvefitting app 
 
 %blue cAA+gluc
 pprob=[0.5 2.833333 4.5 17.33333 19 20 27.16667 32.83334];
 GRb = [0.9154519 0.8279884 0.8279884 0.4081633 0.4781341 0.3206997 0.2565598 0.2040816];

 
 
 %green RDM+gluc

 pprog=[2.333333 0.5 0.6666667 3.833333 12.16667 14.16667 17.16667 18.16667 19.33333 20.66667 25.33333 26.66667]; 
 GRg = [1.784257 1.749271 1.702624 1.521866 1.119534 1.090379 0.9912537 0.8338193 0.6297376 0.8163266 0.7230321 0.6530613];


 %pink M63+gluc
 
 pprop = [0.8333334 0.8333334 3.833333 7.5 10 15.33333 16.66667 23.33333 24.83333]; 
 GRp = [0.6355686 0.5714286 0.5889213 0.5306123 0.3906706 0.2565598 0.4198251 0.2740525 0.2507289];

%cftool
%%
%Parameter estimated 
x=0:0.1:35;
Jb = 16.51;
krb = 0.8988;
nb =  1.76;
Jg = 17.9;
krg = 1.761;
ng = 1.456;
Jp = 18.66;
krp = 0.6209;
np = 1.424;

% Plotting data and model 
plot(pprob, GRb,'ok','MarkerSize',7,'MarkerFaceColor','b')
hold on
plot(pprog, GRg,'ok','MarkerSize',7,'MarkerFaceColor','g')
plot(pprop, GRp,'ok','MarkerSize',7,'MarkerFaceColor','m')
plot(NaN,NaN,'k','LineWidth',2)
plot(x, krb*(1./((x/Jb).^nb+1)),'b','LineWidth',2)
plot(x, krg*(1./((x/Jg).^ng+1)),'g','LineWidth',2)
plot(x, krp*(1./((x/Jp).^np+1)),'m','LineWidth',2)
xlabel('Unnecesarry expression (% of total protein)')
ylabel('Growth Rate (hour^{-1})')
text(15,0.7,'\leftarrow m = 1.76',HorizontalAlignment='right')
text(11,1.6,'\leftarrow m = 1.456',HorizontalAlignment='right')
text(2.25,0.45,' m = 1.424 \rightarrow',HorizontalAlignment='left')
lgd = legend('cAA+gluc','RDM+gluc','M63+gluc','Hill`s function(fitting)');
title(lgd,'Medium')