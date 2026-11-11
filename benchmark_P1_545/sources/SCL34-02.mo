connector Pin
  Real v;
  flow Real i;
end Pin;
model Ports0
  Pin n;
  Pin p;
end Ports0;
model Ports1
  Pin nc;
  Pin nv;
  Pin pc;
  Pin pv;
end Ports1;
model Study
  Ports0 currentSensor;
  Ports1 sensor;
  Ports0 voltageSensor;
equation
  connect(sensor.pv, voltageSensor.p);
  connect(voltageSensor.n, sensor.nv);
  connect(sensor.pc, currentSensor.p);
  connect(currentSensor.n, sensor.nc);
end Study;
