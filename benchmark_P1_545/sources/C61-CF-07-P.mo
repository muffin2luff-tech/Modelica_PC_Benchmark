connector Flange
  Real s;
  flow Real f;
end Flange;
model Mass
  Flange p;
end Mass;
model Hub
  Flange left;
  Flange right;
  Mass a;
  Mass b;
  Mass c;
equation
  connect(right,c.p);
  connect(c.p,b.p);
  connect(b.p,a.p);
  connect(a.p,left);
end Hub;
model Study
  Hub h;
end Study;
