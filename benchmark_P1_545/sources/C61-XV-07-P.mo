connector PressurePort
  Real p;
  flow Real q;
end PressurePort;
model Reference
  PressurePort port;
equation
  port.p = 0;
end Reference;
model PumpCore
  parameter Real head = 6;
  parameter Real internalR = 1;
  PressurePort a;
  PressurePort b;
equation
  a.q + b.q = 0;
  a.p - b.p = head + internalR * a.q;
end PumpCore;
model TunedPump
  extends PumpCore;
end TunedPump;
model Restriction
  parameter Real r = 2;
  PressurePort a;
  PressurePort b;
equation
  a.q + b.q = 0;
  a.p - b.p = r * a.q;
end Restriction;
model Study
  Reference ref;
  TunedPump pump(head = 8);
  Restriction left(r = 2);
  Restriction right(r = 4);
  Real result;
equation
  result = left.a.q;
  connect(pump.a, left.a);
  connect(left.a, right.a);
  connect(pump.b, left.b);
  connect(left.b, right.b);
  connect(pump.b, ref.port);
end Study;
