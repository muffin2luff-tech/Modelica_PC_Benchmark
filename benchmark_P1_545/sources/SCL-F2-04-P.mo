model EMF
  parameter Real k(start = 1) = 3;
  Real i;
  Real tau;
  Real tauElectrical;
equation
  tau = - k * i;
  tauElectrical = - tau;
end EMF;
model Study
  EMF emf;
  Real reference;
equation
  reference = 2;
  emf.i = 4;
end Study;
