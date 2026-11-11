model HeatCapacitor
  parameter Real C;
end HeatCapacitor;
model InverseCapacity
  parameter Real C = 1;
  HeatCapacitor mass(C = C);
end InverseCapacity;
model Study
  InverseCapacity unit(C = 840);
end Study;
