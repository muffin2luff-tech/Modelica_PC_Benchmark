model Study
  parameter Real c = 2;
  parameter Real d = 3;
  parameter Real s_rel0 = 1;
  Real f_c;
  Real f_d;
  Real f;
  Real s_rel;
  Real v_rel;
equation
  f_c = c * ( s_rel - s_rel0 );
  f_d = d * v_rel;
  f = f_c + f_d;
  s_rel = 5;
  v_rel = 2;
end Study;
