connector Pin
  Real v;
  flow Real i;
end Pin;
model OnePort
  Pin p;
  Pin n;
  Real v;
  Real i;
equation
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
end OnePort;
model Study
  OnePort a;
  OnePort b;
  OnePort c;
equation
  connect(a.p, b.p);
  connect(b.p, c.p);
  connect(a.n, b.n);
  connect(b.n, c.n);
end Study;
