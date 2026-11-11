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
  connect(n2.p,n1.p);
  connect(n1.p,boundary);
end Study;
