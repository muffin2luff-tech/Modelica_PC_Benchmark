connector HeatPort
  Real T;
  flow Real Q_flow;
end HeatPort;
model Capacity
  HeatPort p;
end Capacity;
model BoundaryBox
  HeatPort right;
end BoundaryBox;
model Hub
  HeatPort left;
  BoundaryBox box;
  Capacity a;
  Capacity b;
equation
  connect(left,a.p);
  connect(a.p,b.p);
  connect(b.p,box.right);
end Hub;
model Study
  Hub h;
end Study;
