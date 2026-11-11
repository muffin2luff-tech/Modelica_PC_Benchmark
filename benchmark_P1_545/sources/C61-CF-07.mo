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
  connect(left,a.p);
  connect(a.p,b.p);
  connect(b.p,c.p);
  connect(c.p,right);
end Hub;
model Study
  Hub h;
end Study;
