model HeatCapacitor
  parameter Real C;
end HeatCapacitor;
model InverseCapacity
  parameter Real C = 720;
  HeatCapacitor mass(C = C);
end InverseCapacity;
model Study
  InverseCapacity unit;
end Study;
