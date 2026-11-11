connector HeatPort
  Real T;
  flow Real Q_flow;
end HeatPort;
model Capacity
  HeatPort p;
end Capacity;
model Study
  HeatPort boundary;
  Capacity n1;
  Capacity n2;
equation
  connect(boundary,n1.p);
  connect(n1.p,n2.p);
end Study;
