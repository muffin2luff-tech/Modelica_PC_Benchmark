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
  p.v-n.v=3*p.i;
end TestRes;
model Tuned
  extends VoltageCore(level=5);
end Tuned;
model Study
  Ref ref;
  VoltageCore left(level=6);
  Tuned right;
  TestRes test;
  Ohmic shuntL(r=5);
  Ohmic shuntR(r=7);
  Real result;
equation
  result=left.p.i;
  connect(ref.p,left.n);
  connect(ref.p,right.n);
  connect(ref.p,shuntL.n);
  connect(ref.p,shuntR.n);
  connect(left.p,test.p);
  connect(left.p,shuntL.p);
  connect(right.p,test.n);
  connect(right.p,shuntR.p);
end Study;
