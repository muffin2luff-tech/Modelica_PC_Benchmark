model Gyrator
  parameter Real G1 = 1;
  parameter Real G2 = 1;
  Real i1;
  Real i2;
  Real v1;
  Real v2;
equation
  i1 = G2 * v2;
  i2 = - G1 * v1;
end Gyrator;
model Study
  Gyrator g(G1 = 2, G2 = 4);
equation
  g.v1 = 6;
  g.v2 = 3;
end Study;
