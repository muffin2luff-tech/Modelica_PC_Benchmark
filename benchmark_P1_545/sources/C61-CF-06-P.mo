connector Flange
  Real phi;
  flow Real tau;
end Flange;
model Rotor
  Flange p;
end Rotor;
model Study
  Flange support;
  Rotor n1;
  Rotor n2;
  Rotor n3;
equation
  connect(n3.p,n2.p);
  connect(n2.p,n1.p);
  connect(n1.p,support);
end Study;
