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
  connect(right,c.p);
  connect(c.p,b.p);
  connect(b.p,a.p);
  connect(a.p,left);
end Hub;
model Study
  Hub h;
end Study;
