connector EffortPort
  Real effort;
  flow Real flowRate;
end EffortPort;
model EffortSourceCore
  parameter Real drive=2;
  parameter Real slope=1;
  EffortPort p;
  Real x;
equation
  p.effort=drive+slope*x;
  p.flowRate=x;
end EffortSourceCore;
model TunedLeft
  extends EffortSourceCore;
end TunedLeft;
model TunedRight
  extends EffortSourceCore;
end TunedRight;
model LeftWrapper
  EffortPort port;
  TunedLeft source(drive=8);
equation
  connect(port,source.p);
end LeftWrapper;
model RightWrapper
  EffortPort port;
  TunedRight source(drive=3);
equation
  connect(port,source.p);
end RightWrapper;
model AffineBridge
  parameter Real k=2;
  EffortPort a;
  EffortPort b;
equation
  a.flowRate+b.flowRate=0;
  a.effort-b.effort=k*a.flowRate;
end AffineBridge;
model AffineLoad
  parameter Real gain=4;
  parameter Real shift=0;
  EffortPort p;
  Real y;
equation
  p.effort=gain*y+shift;
  p.flowRate=-y;
end AffineLoad;
model Study
  LeftWrapper left;
  RightWrapper right;
  AffineBridge bridge;
  AffineLoad probe(gain=4,shift=1);
  AffineLoad sink(gain=5,shift=-1);
  Real result;
equation
  result=probe.y;
  connect(left.port,bridge.a);
  connect(probe.p,bridge.a);
  connect(right.port,bridge.b);
  connect(sink.p,bridge.b);
end Study;
