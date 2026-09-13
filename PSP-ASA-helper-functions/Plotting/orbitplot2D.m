function [] = orbitplot2D(a, e, thetastar, w, Name, options)
%ORBITPLOT2D Plot 2D orbit
%   Detailed explanation goes here
arguments
    a % semimajor axis
    e % eccentricity
    thetastar % true anomaly vector (row vector)
    w % argument of periapsis
    Name % name of orbit
    options.r_scale = 1
    options.LineStyle = "-"
    options.origin = [0; 0]
    options.color = ""
    options.Marker = "none"
    options.MarkerSize = 2
end

if Name ~= ""
    handlevis = "on";
else
    handlevis = "off";
end

xy = kepler2D_to_cartestian(a, e, thetastar, w) + options.origin;
if options.color == ""
    plot(xy(1, :) / options.r_scale, xy(2, :) / options.r_scale, DisplayName = Name, LineStyle = options.LineStyle, HandleVisibility = handlevis); hold on
else
    plot(xy(1, :) / options.r_scale, xy(2, :) / options.r_scale, DisplayName = Name, LineStyle = options.LineStyle, Color = options.color, HandleVisibility = handlevis); hold on
end

if options.Marker ~= "none"
    if options.color == ""
        plot(xy(1, 1) / options.r_scale, xy(2, 1) / options.r_scale, DisplayName = Name, LineStyle = options.LineStyle, HandleVisibility = "off", Marker = options.Marker, MarkerFaceColor = options.color, MarkerSize = options.MarkerSize); hold on
    else
        plot(xy(1, 1) / options.r_scale, xy(2, 1) / options.r_scale, DisplayName = Name, LineStyle = options.LineStyle, Color = options.color, HandleVisibility = "off", Marker = options.Marker, MarkerFaceColor = options.color, MarkerSize = options.MarkerSize); hold on
    end
end

end

function [xy] = kepler2D_to_cartestian(a, e, thetastar, w)
    p = a .* (1 - e .^ 2);
    r = p ./ (1 + e * cos(thetastar));
    x = r .* cos(thetastar + w);
    y = r .* sin(thetastar + w);

    xy = [x; y];
end