[tceti_star,tceti_f,tceti_g,tceti_h] = load_characteristic_values_tceti();
ts = linspace(0,2*pi,200);
figure()
orbitplot2D(tceti_f.a,tceti_f.e,ts,tceti_f.w,"Planet F",r_scale=tceti_star.l)
orbitplot2D(tceti_g.a,tceti_g.e,ts,tceti_g.w,"Planet G",r_scale=tceti_star.l,color="red")
orbitplot2D(tceti_h.a,tceti_h.e,ts,tceti_h.w,"Planet H",r_scale=tceti_star.l)
scatter (0,0,100,"yellow","filled",displayName="Tau Ceti")
xy_f = kepler2D_to_cartestian (tceti_f.a/tceti_star.l,tceti_f.e,tceti_f.thetastar,tceti_f.w)
scatter (xy_f(1),xy_f(2),50,"blue","filled",displayName="Planet F")
xy_g = kepler2D_to_cartestian (tceti_g.a/tceti_star.l,tceti_g.e,tceti_g.thetastar,tceti_g.w)
scatter (xy_g(1),xy_g(2),50,"red","filled",displayName="Planet G")
xy_h = kepler2D_to_cartestian (tceti_h.a/tceti_star.l,tceti_h.e,tceti_h.thetastar,tceti_h.w)
scatter (xy_h(1),xy_h(2),50,"yellow","filled",displayName="Planet H")
axis equal
grid on
legend
xlabel ("X [ND]")
ylabel ("Y [ND]")
title ("Orbit Plot")
