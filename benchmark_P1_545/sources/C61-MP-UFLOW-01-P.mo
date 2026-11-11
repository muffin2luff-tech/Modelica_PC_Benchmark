connector Pin
  Real v;
  flow Real i;
end Pin;
model Sensor
  Pin p;
  Real y;
equation
  p.v=5;
  y=7*p.i+2;
end Sensor;
model Study
  Sensor s;
  Real result;
equation
  result=s.y;
end Study;
