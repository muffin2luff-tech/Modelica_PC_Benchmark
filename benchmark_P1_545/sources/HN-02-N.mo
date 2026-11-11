model Gain
  parameter Real k = 1;
end Gain;
model Ctrl
  parameter Real p = 2;
  Gain g(k = 3 * p);
end Ctrl;
model Shell
  Ctrl c(p = 5);
end Shell;
model Study
  Shell s;
end Study;
