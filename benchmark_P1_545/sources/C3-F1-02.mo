connector Flange
  Real phi;
  flow Real tau;
end Flange;
model Gear
  Flange support;
  Flange flange_a;
  Flange flange_b;
end Gear;
model Drive
  Flange support;
  Flange flange;
end Drive;
model Fixed
  Flange flange;
end Fixed;
model Study
  Flange boundary;
  Gear gear;
  Drive torque;
  Fixed fixed;
equation
  connect(gear.support, fixed.flange);
  connect(torque.support, fixed.flange);
  connect(boundary, torque.support);
end Study;
