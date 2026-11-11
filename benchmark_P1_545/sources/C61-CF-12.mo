connector NeutralPort
  Real e;
  flow Real f;
end NeutralPort;
model Node
  NeutralPort p;
end Node;
model Study
  NeutralPort boundary;
  Node n1;
  Node n2;
equation
  connect(boundary,n1.p);
  connect(n1.p,n2.p);
end Study;
