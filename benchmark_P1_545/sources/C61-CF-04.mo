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
  connect(left,a.p);
  connect(a.p,b.p);
  connect(b.p,right);
end Hub;
model Study
  Hub h;
end Study;
