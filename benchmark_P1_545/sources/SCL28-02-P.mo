model EddyCurrent
  parameter Real rho = 2;
  parameter Real l = 1;
  parameter Real A = 1;
  parameter Real R = rho * l / A;
end EddyCurrent;
model Study
  extends EddyCurrent(l = 3, A = 4);
end Study;
