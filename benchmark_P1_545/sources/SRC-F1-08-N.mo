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
  Capacity mass1;
  Capacity mass2;
  Capacity Tsensor1;
  Capacity Tsensor2;
  Conduction conduction;
equation
  connect(mass1.port, conduction.port_a);
  connect(conduction.port_b, mass2.port);
  connect(mass2.port, Tsensor1.port);
  connect(mass2.port, Tsensor2.port);
end Study;
