model Cell
  parameter Real k = 1;
  parameter Real value = 3*k;
end Cell;
model Stage
  parameter Real k = 5;
  Cell c(k = k + 2);
end Stage;
model Study
  Stage s(k = 7);
end Study;
