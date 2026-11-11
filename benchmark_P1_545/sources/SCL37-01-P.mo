model Resistor
  parameter Real R = 0;
end Resistor;
model Integrator
  parameter Real R = 240;
  parameter Real twiceR = 2 * R;
  Resistor r(R = twiceR / 2);
end Integrator;
model Study
  Integrator integrator;
end Study;
