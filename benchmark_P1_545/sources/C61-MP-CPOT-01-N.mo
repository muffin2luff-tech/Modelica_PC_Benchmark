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
  connect(a,b);
  connect(b,c);
  connect(d,spare);
end Study;
