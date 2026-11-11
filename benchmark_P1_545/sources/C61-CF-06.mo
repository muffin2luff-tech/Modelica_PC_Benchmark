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
  connect(support,n1.p);
  connect(n1.p,n2.p);
  connect(n2.p,n3.p);
end Study;
