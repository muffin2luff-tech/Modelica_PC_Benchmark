model Tip
  parameter Real k = 2;
  parameter Real z = k + 1;
end Tip;
model Mid
  parameter Real k = 3;
  Tip tip(k = 2*k);
end Mid;
model Shell
  parameter Real k = 4;
  Mid mid(k = k + 1);
end Shell;
model Study
  Shell s(k = 5);
end Study;
