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
  Wheel first;
  Wheel second(radius = 3);
equation
  first.phi = 3;
  first.force = 4;
  second.phi = first.distance;
  first.torque = second.force;
end Study;
