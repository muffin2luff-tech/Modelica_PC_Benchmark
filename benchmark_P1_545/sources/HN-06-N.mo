model Gain
  parameter Real k = 1;
end Gain;
model Lim
  parameter Real k = 2;
  parameter Real Ni = 1/2;
  Gain track(k = 1/(k * Ni));
end Lim;
model Study
  Lim control(k = 4, Ni = 1/4);
end Study;
