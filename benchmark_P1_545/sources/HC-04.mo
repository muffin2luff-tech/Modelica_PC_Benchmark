model Cell
  parameter Real gain(start = 99) = 5;
end Cell;
model Stage
  parameter Real scale = 3;
  Cell cell(gain = 4 * scale);
end Stage;
model Study
  Stage s(scale = 2);
end Study;
