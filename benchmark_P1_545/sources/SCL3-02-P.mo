model Study
  parameter Real N = 2;
  Real V_m;
  Real i;
  Real Psi;
  Real Phi;
equation
  Phi = 4;
  i = 3;
  Psi = N * Phi;
  V_m = i * N;
end Study;
