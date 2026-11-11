connector Pin
  Real v;
  flow Real i;
end Pin;
model DriverCore
  parameter Real drive=3;
  parameter Real slope=1;
  Pin p;
  Real x;
equation
  p.v=drive+slope*x;
  p.i=x;
end DriverCore;
model LoadCore
  parameter Real gain=5;
  parameter Real shift=1;
  Pin p;
  Real y;
equation
  p.v=gain*y+shift;
  p.i=-y;
end LoadCore;
model TunedLoad
  extends LoadCore;
end TunedLoad;
model Bridge
  parameter Real offset=1;
  parameter Real ratio=2;
  Pin a;
  Pin b;
  Real z;
equation
  a.v=b.v+offset+ratio*z;
  a.i=z;
  b.i=-z;
end Bridge;
model Study
  DriverCore d;
  TunedLoad l(gain=4);
  LoadCore l2(gain=5, shift=-2);
equation
  connect(d.p,l.p);
  connect(d.p,l2.p);
end Study;
