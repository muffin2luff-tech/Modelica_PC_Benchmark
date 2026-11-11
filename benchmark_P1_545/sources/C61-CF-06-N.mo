connector Flange
  Real phi;
  flow Real tau;
end Flange;
model Rotor
  Flange p;
end Rotor;
model BoundaryBox
  Flange support;
end BoundaryBox;
model Study
  BoundaryBox box;
  Rotor n1;
  Rotor n2;
  Rotor n3;
equation
  connect(box.support,n1.p);
  connect(n1.p,n2.p);
  connect(n2.p,n3.p);
end Study;
