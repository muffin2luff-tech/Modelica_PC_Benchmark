model ElastoGap
  parameter Real c(start = 1);
  parameter Real d(start = 1);
  parameter Real s_rel0 = 0;
  parameter Real f_ref = c * s_ref;
  parameter Real s_ref = 1;
  parameter Real n = 1;
end ElastoGap;
model Study
  extends ElastoGap(c = 5, d = 2, s_ref = 3);
end Study;
