connector Pin
  Real v;
  flow Real i;
end Pin;
model PortOwner
  parameter Real level=3;
  Pin q;
equation
  q.v=level;
end PortOwner;
model Coupled
  extends PortOwner(level=5);
  Real state;
  Real y;
equation
  state+q.i=8;
  y=state-2*q.i;
end Coupled;
model Study
  Coupled unit(level=7);
  Real result;
equation
  result=unit.y;
end Study;
