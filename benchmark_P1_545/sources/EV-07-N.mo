model Study
  Real x;
  Real y;
  Real z;
  Real u;
  Real v;
equation
  x + y = 10;
  y + z = 8;
  u = x - z;
  v = 3*u;
end Study;
