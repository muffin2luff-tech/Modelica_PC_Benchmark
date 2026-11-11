model Leaf
  parameter Real x = 1;
  Real y;
  Real z;
equation
  y = x + 1;
  z = 2 * x;
end Leaf;
model Middle
  parameter Real x = 2;
  Leaf b(x = x);
end Middle;
model Outer
  parameter Real x = 3;
  Middle c(b(x = x));
end Outer;
model Study
  Outer d(x = 4);
end Study;
