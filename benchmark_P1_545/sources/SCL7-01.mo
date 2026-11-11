connector Port
  Real s;
  flow Real f;
end Port;
model PortType0
  Port flange;
end PortType0;
model PortType1
  Port flange_a;
  Port flange_b;
end PortType1;
model SensorPorts
  Port flange_a;
  Port flange_b;
equation
  flange_a.s = flange_b.s;
end SensorPorts;
model Study
  SensorPorts forceSensor;
  SensorPorts multiSensor;
  PortType1 mass;
  PortType0 force;
  PortType0 positionSensor1;
  PortType0 speedSensor1;
  PortType0 accSensor1;
  PortType0 positionSensor2;
equation
  connect(forceSensor.flange_a, force.flange);
  connect(mass.flange_a, positionSensor1.flange);
  connect(mass.flange_a, speedSensor1.flange);
  connect(mass.flange_a, accSensor1.flange);
  connect(mass.flange_b, positionSensor2.flange);
  connect(forceSensor.flange_b, multiSensor.flange_a);
  connect(multiSensor.flange_b, mass.flange_a);
end Study;
