connector NeutralPort
  Real e;
  flow Real q;
end NeutralPort;
model Node
  NeutralPort p;
end Node;
model Hub
  NeutralPort left;
  NeutralPort right;
  Node a;
  Node b;
  Node c;
equation
  connect(left,a.p);
  connect(a.p,b.p);
  connect(b.p,c.p);
  connect(c.p,right);
end Hub;
model Study
  Hub h;
end Study;
