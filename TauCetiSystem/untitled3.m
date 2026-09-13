[tceti_star, tceti_f, tceti_g, tceti_h, tceti_e] = load_characteristic_values_tceti();

tceti_f.P = 2*pi*sqrt(tceti_f.a^3 / tceti_star.mu);
tceti_g.P = 2*pi*sqrt(tceti_g.a^3 / tceti_star.mu);
tceti_h.P = 2*pi*sqrt(tceti_h.a^3 / tceti_star.mu);
tceti_e.P = 2*pi*sqrt(tceti_e.a^3 / tceti_star.mu);

tceti_f.P = sec_to_day(tceti_f.P);
tceti_g.P = sec_to_day(tceti_g.P);
tceti_h.P = sec_to_day(tceti_h.P);
tceti_e.P = sec_to_day(tceti_e.P);


