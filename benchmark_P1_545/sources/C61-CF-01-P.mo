connector Port
  Real e;
  flow Real f;
end Port;
model Leaf
  Port p;
end Leaf;
model Study
  Port boundary;
  Leaf n1;
  Leaf n2;
equation
  connect(n2.p,n1.p);
  connect(n1.p,boundary);
end Study;
