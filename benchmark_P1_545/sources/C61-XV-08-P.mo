connector PressurePort
  Real pressure;
  flow Real volumeFlow;
end PressurePort;
model PressureSourceCore
  parameter Real drive=2;
  parameter Real slope=1;
  PressurePort p;
  Real x;
equation
  p.pressure=drive+slope*x;
  p.volumeFlow=x;
end PressureSourceCore;
model TunedLeft
  extends PressureSourceCore;
end TunedLeft;
model TunedRight
  extends PressureSourceCore;
end TunedRight;
model LeftWrapper
  PressurePort port;
  TunedLeft source(drive=8);
equation
  connect(port,source.p);
end LeftWrapper;
model RightWrapper
  PressurePort port;
  TunedRight source(drive=3);
equation
  connect(port,source.p);
end RightWrapper;
model RestrictionBridge
  parameter Real k=2;
  PressurePort a;
  PressurePort b;
equation
  a.volumeFlow+b.volumeFlow=0;
  a.pressure-b.pressure=k*a.volumeFlow;
end RestrictionBridge;
model HydraulicLoad
  parameter Real gain=4;
  parameter Real shift=0;
  PressurePort p;
  Real y;
equation
  p.pressure=gain*y+shift;
  p.volumeFlow=-y;
end HydraulicLoad;
model Study
  LeftWrapper left;
  RightWrapper right;
  RestrictionBridge bridge;
  HydraulicLoad probe(gain=4,shift=1);
  HydraulicLoad sink(gain=5,shift=-1);
  Real result;
equation
  result=probe.y;
  connect(left.port,bridge.a);
  connect(probe.p,bridge.a);
  connect(right.port,bridge.b);
  connect(sink.p,bridge.b);
end Study;
