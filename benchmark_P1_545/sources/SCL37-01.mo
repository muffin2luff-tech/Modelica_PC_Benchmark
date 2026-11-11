model Resistor
  parameter Real R = 0;
end Resistor;
model Integrator
  parameter Real R = 240;
  Resistor r(R = R);
end Integrator;
model Study
  Integrator integrator;
end Study;
