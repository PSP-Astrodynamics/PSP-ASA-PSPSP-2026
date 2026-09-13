function [thetastar_f] = propagate_conic_kep(orbiting_body, mu, t_prop)
    % First convert initial true anomaly into mean anomaly
    M_0 = eccentric_to_mean_anomaly(true_to_eccentric_anomaly(orbiting_body.theta_star, orbiting_body.e), orbiting_body.e);

    % Calculate mean motion
    n = sqrt(mu / orbiting_body.a ^ 3);

    % Calculate change in mean anomaly
    dM = n * t_prop;

    % Get final mean anomaly
    M_f = M_0 + dM;

    % Convert back to true anomaly
    thetastar_f = eccentric_to_true_anomaly(mean_to_eccentric_anomaly(M_f, orbiting_body.e), orbiting_body.e);
end