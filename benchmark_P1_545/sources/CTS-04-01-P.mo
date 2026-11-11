connector Pin
  Real v;
  flow Real i;
end Pin;
model Ref
  Pin p;
equation
  p.v=0;
end Ref;
model VoltageCore
  parameter Real level=5;
  Pin p;
  Pin n;
equation
  p.i+n.i=0;
  p.v-n.v=level;
end VoltageCore;
model CurrentCore
  parameter Real level=3;
  Pin p;
  Pin n;
equation
  p.i+n.i=0;
  p.i=level;
end CurrentCore;
model Ohmic
  parameter Real r=3;
  Pin p;
  Pin n;
equation
  p.i+n.i=0;
  p.v-n.v=r*p.i;
end Ohmic;
model AmplifierCore
  parameter Real gain=2;
  Pin p;
  Pin n;
  Pin s;
  Pin t;
equation
  p.i+n.i=0;
  s.i=0;
  t.i=0;
  p.v-n.v=gain*(s.v-t.v);
end AmplifierCore;
model TransformerCore
  parameter Real ratio=2;
  Pin p1;
  Pin n1;
  Pin p2;
  Pin n2;
equation
  p1.i+n1.i=0;
  p2.i+n2.i=0;
  p1.v-n1.v=ratio*(p2.v-n2.v);
  p2.i=-ratio*p1.i;
end TransformerCore;
model TestRes
  Pin p;
  Pin n;
equation
  p.i+n.i=0;
  p.v-n.v=2*p.i;
end TestRes;
model Tuned
  extends VoltageCore;
end Tuned;
model Study
  Ref ref;
  Tuned drive(level=4);
  Ohmic r1(r=2);
  Ohmic r2(r=5);
  Ohmic r3(r=4);
  Ohmic r4(r=3);
  TestRes test;
  Real result;
equation
  result=test.p.i;
  connect(ref.p,drive.n);
  connect(ref.p,r2.n);
  connect(ref.p,r4.n);
  connect(r1.n,r2.p);
  connect(r1.n,test.p);
  connect(r3.n,r4.p);
  connect(r3.n,test.n);
  connect(drive.p,r1.p);
  connect(drive.p,r3.p);
end Study;
