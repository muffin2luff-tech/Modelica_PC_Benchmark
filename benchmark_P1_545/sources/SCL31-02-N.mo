model Study
  parameter Real r_o = 5;
  parameter Real r_i = 1;
  parameter Real l = 3;
  parameter Real alpha = 2;
  parameter Real mu_0 = 1;
  parameter Real mu_r = 2;
  Real A;
  Real G_m;
equation
  A = ( r_o - r_i ) * l;
  G_m = mu_0 * mu_r * A / ( ( r_o + r_i ) / 2 * alpha ) + 1;
end Study;
