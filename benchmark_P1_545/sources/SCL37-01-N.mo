model Resistor
  parameter Real R = 0;
end Resistor;
model Integrator
  parameter Real R = 240;
  Resistor r(R = R + 1);
end Integrator;
model Study
  Integrator integrator;
end Study;
