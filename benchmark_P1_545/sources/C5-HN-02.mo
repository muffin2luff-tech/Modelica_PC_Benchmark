model Leaf
  parameter Real gain(start = 99) = 2;
  parameter Real offset = gain + 1;
  parameter Real outValue = gain * offset;
end Leaf;
model Middle
  parameter Real base = 3;
  parameter Real gain = 2 * base;
  Leaf leaf(gain = gain + 1);
end Middle;
model Outer
  parameter Real scale = 4;
  Middle m(base = scale + 1);
end Outer;
model Study
  Outer o(scale = 5);
end Study;
