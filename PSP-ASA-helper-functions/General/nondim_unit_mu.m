function [l_star, t_star] = nondim_unit_mu(l_star, mu)
%NONDIM_UNIT_MU Summary of this function goes here
%   Detailed explanation goes here

t_star = sqrt(l_star ^ 3 / mu);

end