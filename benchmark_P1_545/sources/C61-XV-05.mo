connector Flange
  Real v;
  flow Real i;
end Flange;
model Ref
  Flange p;
equation
  p.v=0;
end Ref;
model ForceSourceCore
  parameter Real level=5;
  Flange p;
  Flange n;
equation
  p.i+n.i=0;
  p.v-n.v=level;
end ForceSourceCore;
model CurrentCore
  parameter Real level=3;
  Flange p;
  Flange n;
equation
  p.i+n.i=0;
  p.i=level;
end CurrentCore;
model Compliance
  parameter Real r=3;
  Flange p;
  Flange n;
equation
  p.i+n.i=0;
  p.v-n.v=r*p.i;
end Compliance;
model AmplifierCore
  parameter Real gain=2;
  Flange p;
  Flange n;
  Flange s;
  Flange t;
equation
  p.i+n.i=0;
  s.i=0;
  t.i=0;
  p.v-n.v=gain*(s.v-t.v);
end AmplifierCore;
model TransformerCore
  parameter Real ratio=2;
  Flange p1;
  Flange n1;
  Flange p2;
  Flange n2;
equation
  p1.i+n1.i=0;
  p2.i+n2.i=0;
  p1.v-n1.v=ratio*(p2.v-n2.v);
  p2.i=-ratio*p1.i;
end TransformerCore;
model MonitoredCompliance
  Flange p;
  Flange n;
equation
  p.i+n.i=0;
  p.v-n.v=3*p.i;
end MonitoredCompliance;
model Tuned
  extends ForceSourceCore(level=5);
end Tuned;
model Study
  Ref ref;
  Tuned drive;
  Compliance r1(r=3);
  Compliance r2(r=6);
  Compliance r3(r=5);
  MonitoredCompliance test;
  Real result;
equation
  result=r3.p.i;
  connect(drive.p,r1.p);
  connect(r1.n,r2.p);
  connect(r1.n,r3.p);
  connect(r3.n,test.p);
  connect(ref.p,drive.n);
  connect(ref.p,r2.n);
  connect(ref.p,test.n);
end Study;
