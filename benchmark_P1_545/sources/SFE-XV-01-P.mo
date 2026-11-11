connector Port
  Real v;
  flow Real f;
end Port;
model DriverCore
  parameter Real bias=5;
  parameter Real slope=3;
  Port p;
  Real x;
equation
  p.v=bias+slope*x;
  p.f=x;
end DriverCore;
model TunedDriver
  extends DriverCore;
end TunedDriver;
model LoadCore
  parameter Real gain=4;
  parameter Real shift=1;
  parameter Real scale=1;
  Port p;
  Real y;
equation
  p.v=gain*y+shift;
  p.f=-scale*y;
end LoadCore;
model LinkCore
  parameter Real resistance=2;
  parameter Real offset=1;
  Port a;
  Port b;
equation
  a.f+b.f=0;
  a.v-b.v=resistance*a.f+offset;
end LinkCore;
model SourceShell
  Port out;
  TunedDriver source(bias=7);
equation
  connect(out,source.p);
end SourceShell;
model Study
  SourceShell source;
  LoadCore l1(gain=3,shift=2,scale=1);
  LoadCore l2(gain=5,shift=-1,scale=2);
  LoadCore l3(gain=7,shift=3,scale=1);
  Real result;
equation
  result=l1.y;
  connect(source.out,l1.p);
  connect(l1.p,l2.p);
  connect(l2.p,l3.p);
end Study;
