connector Pin
  Real v;
  flow Real i;
end Pin;
model Study
  Pin a;
  Pin b;
  Pin c;
  Pin d;
  Pin spare;
equation
  connect(d,c);
  connect(c,b);
  connect(b,a);
end Study;
