[star, planet_f, planet_g, planet_h, planet_e] = load_characteristic_values_tceti();

t0 = day_to_sec(0);
TOF1 = day_to_sec(11);
t1 = t0 + TOF1;
TOF2 = day_to_sec(13);
t2 = TOF2 + t1;
TOF3 = day_to_sec(15);
t3 = TOF3 + t2;


thetastarf_f = propagate_conic_kep(planet_f, star.mu, t3);
thetastarf_g = propagate_conic_kep(planet_g, star.mu, t0);
thetastarf_h = propagate_conic_kep(planet_h, star.mu, t1);
thetastarf_e = propagate_conic_kep(planet_e, star.mu, t2);

% Define true anomaly range for full orbit lines
thetastar = linspace(0, 2*pi, 1000);

% Initialize 2D Figure
figure;
hold on;
grid on;
axis equal;

% Plot Tau Ceti at origin
scatter(0, 0, 36, 'y', 'filled', DisplayName = "Tau Ceti");

orbitplot2D(planet_f.a, planet_f.e, thetastar + planet_f.theta_star, planet_f.w, "Planet f Orbit", color = "r", r_scale = star.l, Marker = "o", MarkerSize = 4)
orbitplot2D(planet_g.a, planet_g.e, thetastar + planet_g.theta_star, planet_g.w, "Planet g Orbit", color = "g", r_scale = star.l, Marker = "o", MarkerSize = 4)
orbitplot2D(planet_h.a, planet_h.e, thetastar + planet_h.theta_star, planet_h.w, "Planet h Orbit", color = "b", r_scale = star.l, Marker = "o", MarkerSize = 4)
orbitplot2D(planet_e.a, planet_e.e, thetastar + planet_e.theta_star, planet_e.w, "Planet e (Adrian) Orbit", color = "c", r_scale = star.l, Marker = "o", MarkerSize = 4)

% Labels and Formatting
xlabel('X []');
ylabel('Y []');
title('Tau Ceti System at Initial Time');
legend('Location', 'best');
hold off;
