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
  Ports1 Ground1;
  Ports0 Inductance1;
  Ports0 SaturatingInductance1;
  Ports0 SineVoltage1;
equation
  connect(SineVoltage1.n, Ground1.p);
  connect(SineVoltage1.n, SaturatingInductance1.n);
  connect(SaturatingInductance1.p, SineVoltage1.p);
  connect(Inductance1.p, SineVoltage1.p);
  connect(Inductance1.n, SineVoltage1.n);
end Study;
