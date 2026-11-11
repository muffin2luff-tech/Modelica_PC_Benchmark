partial model Root
  replaceable Real x;
end Root;

partial model Mid
  extends Root(redeclare replaceable parameter Real x);
end Mid;

model Study
  extends Mid(x = 5);
  Real result = x;
end Study;
