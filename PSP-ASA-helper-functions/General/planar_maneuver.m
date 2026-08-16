function [maneuver, h] = planar_maneuver(a, r, e, ascension, mu)
%PLANAR_MANEUVER Summary of this function goes here
%   Detailed explanation goes here
arguments
    a (2, 1)
    r (1, 1)
    e (2, 1)
    ascension (2, 1)
    mu = 1
end

p = a .* (1 - e .^ 2);
v = vis_viva(a, r, mu);
h = sqrt(mu * p);
gamma = real(ascension .* acos(h ./ (r .* v))); % imaginary sometimes for circles

delta_gamma = gamma(2) - gamma(1);
dV = sqrt(v(1) ^ 2 + v(2) ^ 2 - 2 * v(1) * v(2) * cos(delta_gamma));
alpha = asin(v(2) / dV * sin(delta_gamma));

% Package outputs
maneuver.dV = dV;
maneuver.alpha = alpha;
maneuver.v = v;
maneuver.gamma = gamma;

end