connector HeatPort
  Real T;
  flow Real Q_flow;
end HeatPort;
model Capacity
  HeatPort p;
end Capacity;
model BoundaryBox
  HeatPort boundary;
end BoundaryBox;
model Study
  BoundaryBox box;
  Capacity n1;
  Capacity n2;
equation
  connect(box.boundary,n1.p);
  connect(n1.p,n2.p);
end Study;
