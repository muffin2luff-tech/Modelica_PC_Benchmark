model Base
  parameter Real k=3;
end Base;
model Tuned
  extends Base(k=4);
end Tuned;
model Study
  Tuned unit(k=6);
  Real result;
equation
  result=unit.k;
end Study;
