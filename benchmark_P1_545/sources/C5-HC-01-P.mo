model BaseCell
  parameter Real gain(start = 99) = 2;
  parameter Real offset = gain + 1;
end BaseCell;
model Cell
  extends BaseCell;
  parameter Real outValue = (offset - 1) * gain;
end Cell;
model Stage
  parameter Real seed = 3;
  parameter Real trim = 2;
  Cell c(gain = seed * trim, offset = seed + trim);
end Stage;
model Study
  Stage s(seed = 4, trim = 3);
end Study;
