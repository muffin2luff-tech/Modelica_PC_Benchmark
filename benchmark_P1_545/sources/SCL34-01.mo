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
model Ports2
  Pin pin_n;
  Pin pin_p;
end Ports2;
model Study
  Ports0 capacitor;
  Ports0 currentSource;
  Ports2 currentToVoltage;
  Ports1 ground;
equation
  connect(capacitor.p, currentToVoltage.pin_p);
  connect(capacitor.n, currentToVoltage.pin_n);
  connect(currentSource.p, ground.p);
  connect(ground.p, capacitor.n);
  connect(currentSource.n, capacitor.p);
end Study;
