model Core
  parameter Real r = 2;
  parameter Real outValue = r+r;
end Core;
model Node
  parameter Real base = 2;
  Core core(r = base + 1);
end Node;
model Shell
  parameter Real scale = 3;
  Node node(base = 2*scale);
end Shell;
model Study
  Shell s(scale = 4);
end Study;
