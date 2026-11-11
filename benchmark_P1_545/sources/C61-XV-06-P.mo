connector Flange
  Real s;
  flow Real f;
end Flange;
model Reference
  Flange p;
equation
  p.s = 0;
end Reference;
model Drive
  parameter Real level = 6;
  Flange p;
  Real x;
equation
  p.s = level + x;
  p.f = x;
end Drive;
model Load
  parameter Real gain = 4;
  parameter Real shift = 1;
  Flange p;
  Real y;
equation
  p.s = gain * y + shift;
  p.f = - y;
end Load;
model LeverCore
  parameter Real ratio = 2;
  Flange left;
  Flange right;
  Flange pivot;
equation
  left.f + right.f + pivot.f = 0;
  right.f = - ratio * left.f;
  left.s - pivot.s = ratio * ( right.s - pivot.s );
end LeverCore;
model TunedLever
  extends LeverCore;
end TunedLever;
model Housing
  Flange left;
  Flange right;
  Flange pivot;
  TunedLever lever(ratio = 3);
equation
  connect(left, lever.left);
  connect(right, lever.right);
  connect(pivot, lever.pivot);
end Housing;
model Study
  Reference ref;
  Drive drive(level = 6);
  Load load(gain = 4, shift = 1);
  Housing h;
  Real result;
equation
  result = load.y;
  connect(drive.p, h.left);
  connect(load.p, h.right);
  connect(ref.p, h.pivot);
end Study;
