model Wheel
  parameter Real radius = 2;
  Real phi;
  Real distance;
  Real force;
  Real torque;
equation
  phi * radius = distance;
  0 = radius * force + torque;
end Wheel;
model Study
  Wheel wheel;
equation
  wheel.phi = 4;
  wheel.force = 5;
end Study;
