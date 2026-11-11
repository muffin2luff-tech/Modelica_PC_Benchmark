model EddyCurrent
  parameter Real rho;
  parameter Real l = 1;
  parameter Real A = 1;
  parameter Real R = rho * l / A;
end EddyCurrent;
model Study
  extends EddyCurrent(rho = 2, l = 3, A = 3);
end Study;
