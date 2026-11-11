model Cell
  parameter Real p = 2;
  parameter Real outValue = 1 + p;
end Cell;
model Mid
  parameter Real a = 3;
  parameter Real b = 2*a;
  Cell c(p = a + b);
end Mid;
model Study
  Mid m(a = 4);
end Study;
