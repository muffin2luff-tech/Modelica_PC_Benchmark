model Base
  parameter Real k=2;
end Base;
model Tuned
  extends Base(k=4);
end Tuned;
model Study
  Tuned unit(k=7);
  Real result;
equation
  result=unit.k;
end Study;
