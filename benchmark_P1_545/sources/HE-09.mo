model Base
  parameter Real k = 2;
end Base;
model Cell
  parameter Real gain = 1;
end Cell;
model Mid
  extends Base(k = 4);
  parameter Real bias = k + 1;
  Cell cell(gain = 3*bias);
end Mid;
model Study
  extends Mid(k = 6);
end Study;
