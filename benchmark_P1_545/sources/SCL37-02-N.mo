model Derivative
  parameter Real k = 1;
  parameter Real R1 = 1000;
  parameter Real R2 = k * R1 + 1;
end Derivative;
model Study
  extends Derivative(k = 3, R1 = 1000);
end Study;
