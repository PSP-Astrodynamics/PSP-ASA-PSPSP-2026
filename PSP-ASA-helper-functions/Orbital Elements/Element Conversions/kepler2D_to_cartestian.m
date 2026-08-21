function [xy] = kepler2D_to_cartestian(a, e, thetastar, w)
    p = a .* (1 - e .^ 2);
    r = p ./ (1 + e * cos(thetastar));
    x = r .* cos(thetastar + w);
    y = r .* sin(thetastar + w);

    xy = [x; y];
end