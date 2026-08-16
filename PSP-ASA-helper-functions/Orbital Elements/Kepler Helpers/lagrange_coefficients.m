function [lagranges] = lagrange_coefficients(r1, r2, a, e, ToF, delta_conic_anomaly, options)
%LAGRANGE_COEFFICIENTS Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    r1
    r2
    a
    e
    ToF
    delta_conic_anomaly % delta_E or delta_H
    options.mu = 1
    options.lagrange_tolerance = 1e-8
end

mean_motion = sqrt(options.mu / abs(a) ^ 3);

% Wrangle Lagrange
if e < 1 % e < 1 - eccentric
    lagranges.f = 1 - a / r1 * (1 - cos(delta_conic_anomaly));
    lagranges.g = ToF + (sin(delta_conic_anomaly) - delta_conic_anomaly) / mean_motion;
    lagranges.fdot = -mean_motion * a ^ 2 / (r2 * r1) * sin(delta_conic_anomaly);
    lagranges.gdot = 1 - a / r2 * (1 - cos(delta_conic_anomaly));
elseif e > 1 % e > 1 - hyperbolic
    lagranges.f = 1 - a / r1 * (1 - cosh(delta_conic_anomaly));
    lagranges.g = ToF - (sinh(delta_conic_anomaly) - delta_conic_anomaly) / mean_motion;
    lagranges.fdot = -mean_motion * a ^ 2 / (r2 * r1) * sinh(delta_conic_anomaly);
    lagranges.gdot = 1 - a / r2 * (1 - cosh(delta_conic_anomaly));
end

% Check coefficients
lagrange_ck = abs(lagranges.f * lagranges.gdot - lagranges.fdot * lagranges.g - 1); % Should be zero
if lagrange_ck > options.lagrange_tolerance
    warning("Lagrange coefficient accuracy %.3g is more than %.3g", lagrange_ck, options.lagrange_tolerance);
end

end