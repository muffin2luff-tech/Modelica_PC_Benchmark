model BaseCell
  parameter Real gain = 2;
  parameter Real offset = gain + 1;
end BaseCell;
model Cell
  extends BaseCell;
  parameter Real outValue = gain + 2*offset;
end Cell;
model Stage
  parameter Real bias = 3;
  Cell left(gain = bias + 1);
  Cell right(gain = 2*bias, offset = bias - 1);
end Stage;
model Study
  Stage s(bias = 5);
end Study;
