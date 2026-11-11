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
  Ports0 aD_Converter;
  Ports0 dA_Converter;
  Ports1 ground;
  Ports0 resistor;
  Ports0 sineVoltage;
equation
  connect(aD_Converter.p, sineVoltage.p);
  connect(sineVoltage.n, aD_Converter.n);
  connect(ground.p, sineVoltage.n);
  connect(sineVoltage.p, resistor.p);
  connect(dA_Converter.p, resistor.n);
  connect(dA_Converter.n, ground.p);
end Study;
