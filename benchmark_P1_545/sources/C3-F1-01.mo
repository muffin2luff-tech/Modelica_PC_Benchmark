connector HeatPort
  Real T;
  flow Real Q_flow;
end HeatPort;
model Capacity
  HeatPort port;
end Capacity;
model Convection
  HeatPort solid;
  HeatPort fluid;
end Convection;
model Study
  HeatPort boundary;
  Capacity core;
  Capacity Tcore;
  Convection convection;
equation
  connect(boundary, core.port);
  connect(core.port, Tcore.port);
  connect(Tcore.port, convection.solid);
end Study;
