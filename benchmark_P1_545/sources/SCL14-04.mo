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
  Ports0 Capacitor1;
  Ports1 G;
  Ports0 HeatingDiode1;
  Ports0 R;
  Ports0 SineVoltage1;
equation
  connect(SineVoltage1.p, HeatingDiode1.p);
  connect(SineVoltage1.n, G.p);
  connect(Capacitor1.n, G.p);
  connect(HeatingDiode1.n, Capacitor1.p);
  connect(R.p, Capacitor1.p);
  connect(R.n, Capacitor1.n);
end Study;
