connector Flange
  Real phi;
  flow Real tau;
end Flange;
model ActuatorCore
  parameter Real bias=3;
  parameter Real slope=1;
  Flange p;
  Real x;
equation
  p.phi=bias+slope*x;
  p.tau=x;
end ActuatorCore;
model TunedActuator
  extends ActuatorCore(bias=7);
end TunedActuator;
model Shell
  Flange port;
  TunedActuator source;
equation
  connect(port,source.p);
end Shell;
model ComplianceLoad
  parameter Real gain=5;
  parameter Real shift=1;
  Flange p;
  Real y;
equation
  p.phi=gain*y+shift;
  p.tau=-y;
end ComplianceLoad;
model Reference
  Flange p;
equation
  p.phi=0;
end Reference;
model Study
  Shell shell;
  ComplianceLoad left(gain=3,shift=1);
  ComplianceLoad right(gain=5,shift=2);
  ComplianceLoad anchor(gain=3,shift=0);
  Reference ref;
  Real result;
equation
  result=left.y;
  connect(shell.port,left.p);
  connect(shell.port,right.p);
  connect(ref.p,anchor.p);
end Study;
