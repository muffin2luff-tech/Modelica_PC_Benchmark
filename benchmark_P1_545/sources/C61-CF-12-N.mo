connector NeutralPort
  Real e;
  flow Real f;
end NeutralPort;
model Node
  NeutralPort p;
end Node;
model BoundaryBox
  NeutralPort boundary;
end BoundaryBox;
model Study
  BoundaryBox box;
  Node n1;
  Node n2;
equation
  connect(box.boundary,n1.p);
  connect(n1.p,n2.p);
end Study;
