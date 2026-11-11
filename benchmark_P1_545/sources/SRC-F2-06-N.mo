model Transformer
  parameter Real n = 2;
  Real v1;
  Real v2;
  Real i1;
  Real i2;
equation
  0 = i1 + i2 / n;
  v1 = n * v2;
end Transformer;
model Study
  Transformer t;
equation
  t.v1 = 6;
  t.v2 = 3;
end Study;
