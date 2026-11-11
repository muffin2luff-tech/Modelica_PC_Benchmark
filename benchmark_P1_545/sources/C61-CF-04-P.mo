connector HeatPort
  Real T;
  flow Real Q_flow;
end HeatPort;
model Capacity
  HeatPort p;
end Capacity;
model Hub
  HeatPort left;
  HeatPort right;
  Capacity a;
  Capacity b;
equation
  connect(right,b.p);
  connect(b.p,a.p);
  connect(a.p,left);
end Hub;
model Study
  Hub h;
end Study;
