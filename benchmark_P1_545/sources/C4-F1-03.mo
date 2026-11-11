connector HeatPort
  Real T;
  flow Real Q_flow;
end HeatPort;
model Capacity
  HeatPort port;
end Capacity;
model Conduction
  HeatPort port_a;
  HeatPort port_b;
end Conduction;
model Study
  HeatPort boundary;
  Capacity winding;
  Capacity windingLosses;
  Capacity Twinding;
  Capacity core;
  Conduction winding2core;
equation
  connect(boundary, winding.port);
  connect(winding.port, windingLosses.port);
  connect(winding.port, Twinding.port);
  connect(Twinding.port, winding2core.port_a);
  connect(winding2core.port_b, core.port);
end Study;
