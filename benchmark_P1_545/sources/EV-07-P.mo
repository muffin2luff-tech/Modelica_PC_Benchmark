model Study
  Real x;
  Real y;
  Real z;
  Real u;
  Real v;
equation
  x + y = 10;
  y + z = 8;
  u = -z + x;
  v = 2*u;
end Study;
