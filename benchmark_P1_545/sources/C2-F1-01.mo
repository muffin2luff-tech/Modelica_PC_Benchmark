connector Pin
  Real v;
  flow Real i;
end Pin;
model OnePort
  Pin p;
  Pin n;
end OnePort;
model Study
  Pin boundary;
  OnePort left;
  OnePort right;
equation
  connect(boundary, left.p);
  connect(left.p, right.p);
end Study;
