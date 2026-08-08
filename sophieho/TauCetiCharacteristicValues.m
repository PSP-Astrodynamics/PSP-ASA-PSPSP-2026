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
    tceti_g.mu = 470350.215061; %[f km3 / s2]
    tceti_g.a = 19896517; %[km]
    tceti_g.e = 0.06;
    tceti_g.theta_star = 0; %[km/s]
end

function [tceti_h] = load_characteristic_values_tceti_h()
    tceti_h.mu = 474336.233832; %[km3 / s2]
    tceti_h.a = 36352283; %[km]
    tceti_h.e = 0.23;
    tceti_t.theta_star = 143; %[km/s]
end

star = load_characteristic_values_tceti_star();
planet_e = load_characteristic_values_tceti_e();
planet_g = load_characteristic_values_tceti_g();
planet_h = load_characteristic_values_tceti_h();

% Clear workspace and load data
clear; clc;
star = load_characteristic_values_tceti_star();
planet_e = load_characteristic_values_tceti_e();
planet_g = load_characteristic_values_tceti_g();
planet_h = load_characteristic_values_tceti_h();

% Define true anomaly range for full orbit lines
theta = linspace(0, 2*pi, 1000);

% Function to compute 2D orbit coordinates (coplanar)
get_orbit_2d = @(a, e) deal( ...
    a .* (1 - e^2) ./ (1 + e * cos(theta)) .* cos(theta), ...
    a .* (1 - e^2) ./ (1 + e * cos(theta)) .* sin(theta) );

[xe, ye] = get_orbit_2d(planet_e.a, planet_e.e);
[xg, yg] = get_orbit_2d(planet_g.a, planet_g.e);
[xh, yh] = get_orbit_2d(planet_h.a, planet_h.e);

% Initialize 2D Figure
figure;
hold on;
grid on;
axis equal;

% Plot Tau Ceti at origin
plot(0, 0, 'yo', 'MarkerSize', 14, 'MarkerFaceColor', 'y');

% Plot Coplanar Orbit Paths
plot(xe, ye, 'r-', 'LineWidth', 1.5);
plot(xg, yg, 'g-', 'LineWidth', 1.5);
plot(xh, yh, 'b-', 'LineWidth', 1.5);

% Plot Current Planet Positions using theta_star
plot_planet = @(p, color) plot( ...
    (p.a * (1 - p.e^2) / (1 + p.e * cosd(p.theta_star))) * cosd(p.theta_star), ...
    (p.a * (1 - p.e^2) / (1 + p.e * cosd(p.theta_star))) * sind(p.theta_star), ...
    color, 'MarkerSize', 8, 'MarkerFaceColor', color(1));

plot_planet(planet_e, 'ro');
plot_planet(planet_g, 'go');
plot_planet(planet_h, 'bo');

% Labels and Formatting
xlabel('X (km)');
ylabel('Y (km)');
title('Tau Ceti Coplanar Orbital Diagram');
legend('Tau Ceti', 'Planet e Orbit', 'Planet g Orbit', 'Planet h Orbit', ...
    'Location', 'best');
hold off;