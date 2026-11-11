connector HeatPort
  Real v;
  flow Real i;
end HeatPort;
model Ref
  HeatPort p;
equation
  p.v=0;
end Ref;
model HeatSourceCore
  parameter Real level=5;
  HeatPort p;
  HeatPort n;
equation
  p.i+n.i=0;
  p.v-n.v=level;
end HeatSourceCore;
model CurrentCore
  parameter Real level=3;
  HeatPort p;
  HeatPort n;
equation
  p.i+n.i=0;
  p.i=level;
end CurrentCore;
model ThermalResistance
  parameter Real r=3;
  HeatPort p;
  HeatPort n;
equation
  p.i+n.i=0;
  p.v-n.v=r*p.i;
end ThermalResistance;
model AmplifierCore
  parameter Real gain=2;
  HeatPort p;
  HeatPort n;
  HeatPort s;
  HeatPort t;
equation
  p.i+n.i=0;
  s.i=0;
  t.i=0;
  p.v-n.v=gain*(s.v-t.v);
end AmplifierCore;
model TransformerCore
  parameter Real ratio=2;
  HeatPort p1;
  HeatPort n1;
  HeatPort p2;
  HeatPort n2;
equation
  p1.i+n1.i=0;
  p2.i+n2.i=0;
  p1.v-n1.v=ratio*(p2.v-n2.v);
  p2.i=-ratio*p1.i;
end TransformerCore;
model MonitoredResistance
  HeatPort p;
  HeatPort n;
equation
  p.i+n.i=0;
  p.v-n.v=2*p.i;
end MonitoredResistance;
model Tuned
  extends HeatSourceCore(level=4);
end Tuned;
model Study
  Ref ref;
  Tuned drive;
  MonitoredResistance test;
  ThermalResistance load(r=4);
  Real result;
equation
  result=test.p.i;
  connect(drive.p,test.p);
  connect(test.n,load.p);
  connect(ref.p,drive.n);
  connect(ref.p,load.n);
end Study;
