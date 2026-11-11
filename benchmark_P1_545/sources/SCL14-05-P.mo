connector Pin
  Real v;
  flow Real i;
end Pin;
model Ports0
  Pin n;
  Pin p;
end Ports0;
model Ports1
  Pin p;
end Ports1;
model Study
  Ports0 bufferCapacitor;
  Ports0 cable;
  Ports0 dcPowerSupply;
  Ports0 diode;
  Ports1 ground;
  Ports0 loadCurrent;
equation
  connect(ground.p, dcPowerSupply.n);
  connect(dcPowerSupply.p, cable.p);
  connect(cable.n, diode.p);
  connect(diode.n, bufferCapacitor.p);
  connect(bufferCapacitor.p, loadCurrent.p);
  connect(bufferCapacitor.n, loadCurrent.n);
  connect(ground.p, bufferCapacitor.n);
end Study;
