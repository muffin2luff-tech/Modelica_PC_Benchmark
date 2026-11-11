model Study
  parameter Real L1 = 2;
  parameter Real L2 = 3;
  parameter Real M = 1;
  Real di1;
  Real di2;
  Real v1;
  Real v2;
  Real dv;
equation
  v1 = L1 * di1 + M * di2;
  2 * ( dv ) = 2 * ( ( L1 - M ) * di1 + ( M - L2 ) * di2 );
  v2 = v1 - dv;
  di1 = 1;
  di2 = 2;
  v1 = 4;
  v2 = 7;
end Study;
