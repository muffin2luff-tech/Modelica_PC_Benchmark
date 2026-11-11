connector HeatPort
  Real T;
  flow Real Q_flow;
end HeatPort;
model HeatSourceCore
  parameter Real bias=3;
  parameter Real slope=1;
  HeatPort p;
  Real x;
equation
  p.T=bias+slope*x;
  p.Q_flow=x;
end HeatSourceCore;
model TunedHeatSource
  extends HeatSourceCore(bias=8);
end TunedHeatSource;
model Shell
  HeatPort port;
  TunedHeatSource source;
equation
  connect(port,source.p);
end Shell;
model ThermalLoad
  parameter Real gain=5;
  parameter Real shift=1;
  HeatPort p;
  Real y;
equation
  p.T=gain*y+shift;
  p.Q_flow=-y;
end ThermalLoad;
model Reference
  HeatPort p;
equation
  p.T=0;
end Reference;
model Study
  Shell shell;
  ThermalLoad left(gain=4,shift=1);
  ThermalLoad right(gain=6,shift=2);
  ThermalLoad anchor(gain=3,shift=0);
  Reference ref;
  Real result;
equation
  result=left.y;
  connect(shell.port,left.p);
  connect(shell.port,right.p);
  connect(ref.p,anchor.p);
end Study;
