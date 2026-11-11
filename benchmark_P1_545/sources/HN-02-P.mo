model Gain
  parameter Real k = 1;
end Gain;
model Ctrl
  parameter Real p = 2;
  Gain g(k = p + p + p);
end Ctrl;
model Shell
  Ctrl c(p = 4);
end Shell;
model Study
  Shell s;
end Study;
