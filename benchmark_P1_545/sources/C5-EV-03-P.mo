model Study
  Real a;
  Real b;
  Real c;
  Real d;
  Real e;
  Real u;
  Real v;
equation
  a+b=10;
  b+c=6;
  c+d=8;
  d+e=4;
  u=2*d+e-b+a-c;
  v=2*u+1;
end Study;
