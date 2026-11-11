connector Port
  Real v;
  flow Real f;
end Port;
model DriverCore
  parameter Real bias=5;
  parameter Real slope=8;
  Port p;
  Real x;
equation
  p.v=bias+slope*x;
  p.f=x;
end DriverCore;
model TunedDriver
  extends DriverCore(bias=7);
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
  TunedDriver source;
equation
  connect(out,source.p);
end SourceShell;
model Study
  SourceShell source;
  LinkCore k1(resistance=2,offset=-1);
  LinkCore k2(resistance=3,offset=0);
  LinkCore k3(resistance=4,offset=1);
  LinkCore k4(resistance=5,offset=2);
  LoadCore l1(gain=3,shift=2,scale=1);
  LoadCore l2(gain=5,shift=-1,scale=2);
  LoadCore l3(gain=7,shift=3,scale=1);
  Real result;
equation
  result=l1.y;
  connect(source.out,k1.a);
  connect(k1.a,k2.a);
  connect(k1.b,k3.a);
  connect(k3.a,l2.p);
  connect(k2.b,k4.a);
  connect(k4.a,l3.p);
  connect(k3.b,k4.b);
  connect(k4.b,l1.p);
end Study;
