function out = tooooooo
out{1} = @init;
out{2} = @fun_eval;
out{3} = [];
out{4} = [];
out{5} = [];
out{6} = [];
out{7} = [];
out{8} = [];
out{9} = [];

% --------------------------------------------------------------------------
function dydt = fun_eval(t,kmrgd,par_k01,par_k11,par_K1,par_d01,par_n1,par_m,par_J,par_k02,par_k12,par_K2,par_d02,par_n2,par_tsc,par_kg0,par_al)
dydt=[par_k01*par_tsc+par_k11*par_tsc*(par_K1^par_n1)/(kmrgd(2)^par_n1+par_K1^par_n1)-par_d01*par_tsc*kmrgd(1)-par_kg0*kmrgd(1)/(((kmrgd(1)+kmrgd(2))/par_J)^par_m+1);
par_k02*par_tsc+par_al*par_k12*par_tsc*(par_K2^par_n2)/(kmrgd(1)^par_n2+par_K2^par_n2)-par_d02*par_tsc*kmrgd(2)-par_kg0*kmrgd(2)/(((kmrgd(1)+kmrgd(2))/par_J)^par_m+1);];

% --------------------------------------------------------------------------
function [tspan,y0,options] = init
handles = feval(tooooooo);
y0=[0,0];
options = odeset('Jacobian',[],'JacobianP',[],'Hessians',[],'HessiansP',[]);
tspan = [0 10];

% --------------------------------------------------------------------------
function jac = jacobian(t,kmrgd,par_k01,par_k11,par_K1,par_d01,par_n1,par_m,par_J,par_k02,par_k12,par_K2,par_d02,par_n2,par_tsc,par_kg0,par_al)
% --------------------------------------------------------------------------
function jacp = jacobianp(t,kmrgd,par_k01,par_k11,par_K1,par_d01,par_n1,par_m,par_J,par_k02,par_k12,par_K2,par_d02,par_n2,par_tsc,par_kg0,par_al)
% --------------------------------------------------------------------------
function hess = hessians(t,kmrgd,par_k01,par_k11,par_K1,par_d01,par_n1,par_m,par_J,par_k02,par_k12,par_K2,par_d02,par_n2,par_tsc,par_kg0,par_al)
% --------------------------------------------------------------------------
function hessp = hessiansp(t,kmrgd,par_k01,par_k11,par_K1,par_d01,par_n1,par_m,par_J,par_k02,par_k12,par_K2,par_d02,par_n2,par_tsc,par_kg0,par_al)
%---------------------------------------------------------------------------
function tens3  = der3(t,kmrgd,par_k01,par_k11,par_K1,par_d01,par_n1,par_m,par_J,par_k02,par_k12,par_K2,par_d02,par_n2,par_tsc,par_kg0,par_al)
%---------------------------------------------------------------------------
function tens4  = der4(t,kmrgd,par_k01,par_k11,par_K1,par_d01,par_n1,par_m,par_J,par_k02,par_k12,par_K2,par_d02,par_n2,par_tsc,par_kg0,par_al)
%---------------------------------------------------------------------------
function tens5  = der5(t,kmrgd,par_k01,par_k11,par_K1,par_d01,par_n1,par_m,par_J,par_k02,par_k12,par_K2,par_d02,par_n2,par_tsc,par_kg0,par_al)
