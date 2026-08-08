function [tceti_star] = load_characteristic_values_tceti_star()
    tceti_star.mu = 106121370000000000000; %[ km3 / s2]
    tceti_star.l = 1658765389; %[km]
    tceti_star.t = sqrt(tceti_star.mu^-1 * tceti_star.l^3); %[s]
    tceti_star.v = tceti_star.l/tceti_star.t; %[km/s]
    tceti_star.a = tceti_star.v/tceti_star.t;%[km/s^2]
end

function [tceti_f] = load_characteristic_values_tceti_e()
    tceti_f.mu = 1566504.9301; %[km3 / s2] NASA data
    tceti_f.a = 199564000; %[km] NASA data
    tceti_f.e = 0.16; % NASA data
    tceti_f.theta_star = 65; %[km/s] 
end

function [tceti_g] = load_characteristic_values_tceti_g()
    tceti_g.mu = 470350.215061; %[ km3 / s2]
    tceti_g.a = 19896517; %[km]
    tceti_g.e = 0.06;
    tceti_g.theta_star = 0; %[km/s]
end

function [tceti_h] = load_characteristic_values_tceti_h()
    tceti_h.mu = 474336.233832; %[ km3 / s2]
    tceti_h.a = 36352283; %[km]
    tceti_h.e = 0.23;
    tceti_t.theta_star = 143; %[km/s]
end

function [tceti_e] = load_characteristic_values_tceti_e()
    tceti_e.mu = 1566504.9301;
    tceti_e.a = 150000000; % from book
    tceti_e.e = 0.15; % no data from book, instead took average of other three planets
    tceti_e.theta_star = 324;
end