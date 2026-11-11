model Study
  parameter Real ratio = 2;
  Real phi_a;
  Real phi_b;
  Real flange_a_phi;
  Real flange_b_phi;
  Real phi_support;
  Real flange_a_tau;
  Real flange_b_tau;
  Real tauLoss;
equation
  phi_a = flange_a_phi - phi_support;
  phi_b = flange_b_phi - phi_support;
  phi_a = ratio * phi_b;
  0 = flange_b_tau + ratio * ( flange_a_tau - tauLoss );
  flange_a_phi = 5;
  flange_b_phi = 3;
  phi_support = 1;
  flange_a_tau = 4;
  tauLoss = 2;
end Study;
