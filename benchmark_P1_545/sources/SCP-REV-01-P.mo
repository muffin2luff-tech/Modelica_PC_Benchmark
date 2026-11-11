connector T08
  Real v;
  flow Real f;
end T08;

connector T21
  T08 a;
end T21;

connector T04
  T08 a;
  T08 b;
end T04;

connector T17
  T21 branch;
end T17;

connector T10
  T21 left;
  T21 right;
end T10;

model T03
  T08 a;
  Real x;
equation
  a.v = x;
  a.f = x;
end T03;

model T15
  T08 a;
  T08 b;
  Real xa;
  Real xb;
equation
  a.v = xa;
  a.f = xa;
  b.v = xb;
  b.f = xb;
end T15;

model T06
  T21 branch;
  Real x;
equation
  branch.a.v = x;
  branch.a.f = x;
end T06;

model T19
  T21 left;
  T21 right;
  Real xleft;
  Real xright;
equation
  left.a.v = xleft;
  left.a.f = xleft;
  right.a.v = xright;
  right.a.f = xright;
end T19;

model T12
  T08 p;
  Real x;
equation
  p.v = x;
  p.f = x;
end T12;

model T01
  T08 port;
  T12 core;
equation
  connect(port, core.p);
end T01;

model Scope
  T12 load;
  T21 side;
  T17 deep;
equation
  connect(side.a, load.p);
  connect(deep.branch.a, side.a);
end Scope;

model Study
  Scope w;
end Study;
