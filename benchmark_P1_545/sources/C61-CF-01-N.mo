connector Port
  Real e;
  flow Real f;
end Port;
model Leaf
  Port p;
end Leaf;
model BoundaryBox
  Port boundary;
end BoundaryBox;
model Study
  BoundaryBox box;
  Leaf n1;
  Leaf n2;
equation
  connect(box.boundary,n1.p);
  connect(n1.p,n2.p);
end Study;
