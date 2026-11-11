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
  v_rel = 2;
  s_rel = 4;
  f = f_c + f_d;
  f_d = d * v_rel;
  f_c = c * ( s_rel - s_rel0 );
end Study;
