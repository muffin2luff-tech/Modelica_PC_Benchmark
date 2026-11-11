connector Flange
  Real s;
  flow Real f;
end Flange;
model Element
  Flange flange_a;
  Flange flange_b;
end Element;
model Study
  Flange boundary;
  Element m1;
  Element sd1;
  Element m2;
equation
  connect(boundary, m1.flange_b);
  connect(m1.flange_b, sd1.flange_a);
  connect(sd1.flange_a, m2.flange_a);
end Study;
