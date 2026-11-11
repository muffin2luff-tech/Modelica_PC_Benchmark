model Study
  parameter Real N = 2;
  Real V_m;
  Real i;
  Real Psi;
  Real Phi;
equation
  V_m = i * N;
  Psi = N * Phi;
  i = 3;
  Phi = 4;
end Study;
