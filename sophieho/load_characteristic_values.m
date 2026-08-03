function [tceti_star] = load_characteristic_values()
    tceti_star.mu = 106121370000000000000; %[ km3 / s2]
    tceti_star.l = 1658765389; %[km]
    tceti_star.t = sqrt(tceti_star.mu^-1 * tceti_star.l^3); %[s]
    tceti_star.v = tceti_star.l/tceti_star.t; %[km/s]
    tceti_star.a = tceti_star.v/tceti_star.t;%[km/s^2]
end