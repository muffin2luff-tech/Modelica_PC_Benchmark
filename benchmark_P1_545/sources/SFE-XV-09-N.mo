connector Port
  Real v;
  flow Real f;
end Port;
model DriverCore
  parameter Real bias=5;
  parameter Real slope=11;
  Port p;
  Real x;
equation
  p.v=bias+slope*x;
  p.f=x;
end DriverCore;
model TunedDriver
  extends DriverCore(bias=8);
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
model InnerShell
  Port out;
  TunedDriver source;
equation
  connect(out,source.p);
end InnerShell;
model OuterShell
  Port out;
  InnerShell core;
  LoadCore tap(gain=7,shift=-2,scale=2);
equation
  connect(out,core.out);
  connect(out,tap.p);
end OuterShell;
model Study
  OuterShell source;
  LinkCore k1(resistance=2,offset=-1);
  LoadCore l1(gain=3,shift=2,scale=1);
  LoadCore l2(gain=5,shift=-1,scale=2);
  Real result;
equation
  result=l1.y;
  connect(source.out,k1.a);
  connect(k1.a,l2.p);
  connect(k1.b,l1.p);
end Study;
