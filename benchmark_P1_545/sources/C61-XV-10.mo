connector Port
  Real e;
  flow Real f;
end Port;
model SourceCore
  parameter Real bias=3;
  parameter Real slope=1;
  Port p;
  Real x;
equation
  p.e=bias+slope*x;
  p.f=x;
end SourceCore;
model TunedSource
  extends SourceCore(bias=7);
end TunedSource;
model Shell
  Port port;
  TunedSource source;
equation
  connect(port,source.p);
end Shell;
model Load
  parameter Real gain=5;
  parameter Real shift=1;
  Port p;
  Real y;
equation
  p.e=gain*y+shift;
  p.f=-y;
end Load;
model Reference
  Port p;
equation
  p.e=0;
end Reference;
model Study
  Shell shell;
  SourceCore assist(bias=2,slope=2);
  Load left(gain=5,shift=1);
  Load right(gain=4,shift=2);
  Load anchor(gain=3,shift=0);
  Reference ref;
  Real result;
equation
  result=left.y;
  connect(shell.port,assist.p);
  connect(shell.port,left.p);
  connect(shell.port,right.p);
  connect(ref.p,anchor.p);
end Study;
