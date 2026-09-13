function [v] = vis_viva(a, r, mu)
%VIS_VIVA Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    a
    r
    mu = 1
end

v = sqrt(mu * (2 ./ r - 1 ./ a));

end