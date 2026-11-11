connector HeatPort
  Real T;
  flow Real Q_flow;
end HeatPort;
model Capacity
  HeatPort port;
end Capacity;
model Adaptor
  HeatPort heatPort;
end Adaptor;
model Source
  HeatPort port;
end Source;
model Study
  Source heatFlow3;
  Capacity capacitor3a;
  Capacity capacitor3b;
  Adaptor heatFlowToTemperature3a;
  Adaptor heatFlowToTemperature3b;
equation
  connect(heatFlow3.port, capacitor3a.port);
  connect(capacitor3a.port, heatFlowToTemperature3a.heatPort);
  connect(heatFlowToTemperature3b.heatPort, capacitor3b.port);
end Study;
