connector Pin
  Real v;
  flow Real i;
end Pin;
model BaseR
  parameter Real k=2;
  Pin p;
  Real x;
equation
  p.v=12;
  p.i=k*x;
end BaseR;
model TunedR
  extends BaseR(k=4);
end TunedR;
model Load
  Pin p;
equation
  p.i=-6;
end Load;
model Study
  TunedR driver(k=8);
  Load load;
  Real result;
equation
  result=driver.x;
  connect(driver.p,load.p);
end Study;
