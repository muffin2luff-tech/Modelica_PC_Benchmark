partial model Root
  replaceable Real x;
end Root;

model Study
  extends Root(redeclare Real x);
  Real result;
equation
  x = time;
  result = x;
end Study;
