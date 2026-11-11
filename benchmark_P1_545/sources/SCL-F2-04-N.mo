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
  emf.i = 5;
  reference = 2;
end Study;
