connector Flange
  Real phi;
  flow Real tau;
end Flange;
model Reference
  Flange p;
equation
  p.phi = 0;
end Reference;
model Drive
  parameter Real level = 6;
  Flange p;
  Real x;
equation
  p.phi = level + x;
  p.tau = x;
end Drive;
model GearCore
  parameter Real ratio = 2;
  Flange p1;
  Flange n1;
  Flange p2;
  Flange n2;
equation
  p1.tau + n1.tau = 0;
  p2.tau + n2.tau = 0;
  p1.phi - n1.phi = ratio * ( p2.phi - n2.phi );
  p2.tau = - ratio * p1.tau;
end GearCore;
model TunedGear
  extends GearCore;
end TunedGear;
model Housing
  Flange p1;
  Flange n1;
  Flange p2;
  Flange n2;
  TunedGear gear(ratio = 3);
equation
  connect(p1, gear.p1);
  connect(n1, gear.n1);
  connect(p2, gear.p2);
  connect(n2, gear.n2);
end Housing;
model Compliance
  parameter Real k = 2;
  Flange p;
  Flange n;
equation
  p.tau + n.tau = 0;
  p.phi - n.phi = k * p.tau;
end Compliance;
model Study
  Reference ref;
  Drive drive(level = 6);
  Housing h;
  Compliance load(k = 2);
  Real result;
equation
  result = load.p.tau;
  connect(drive.p, h.p1);
  connect(ref.p, h.n1);
  connect(h.p2, load.p);
  connect(h.n2, load.n);
  connect(ref.p, load.n);
end Study;
