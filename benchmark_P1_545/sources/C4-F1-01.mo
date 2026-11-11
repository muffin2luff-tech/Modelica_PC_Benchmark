connector HeatPort
  Real T;
  flow Real Q_flow;
end HeatPort;
model Mass
  HeatPort port;
end Mass;
model Conduction
  HeatPort port_a;
  HeatPort port_b;
end Conduction;
model Study
  HeatPort boundary;
  Mass mass1;
  Mass mass2;
  Mass sensor;
  Conduction conduction;
equation
  connect(boundary, mass1.port);
  connect(mass1.port, conduction.port_a);
  connect(conduction.port_a, sensor.port);
  connect(conduction.port_b, mass2.port);
end Study;
