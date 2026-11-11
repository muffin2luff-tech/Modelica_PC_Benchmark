model BaseCell
  parameter Real gain = 2;
  parameter Real offset = gain + 1;
end BaseCell;
model Cell
  extends BaseCell;
  parameter Real outValue = offset * gain;
end Cell;
model Node
  parameter Real p = 3;
  parameter Real q = 4;
  Cell c(gain = p + q, offset = 2 * p - q);
end Node;
model System
  Node n(p = 5, q = 2);
end System;
model Study
  System s;
end Study;
