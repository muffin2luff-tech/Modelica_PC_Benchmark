connector IntOut = output Integer;
connector IntIn = input Integer;

block AState
  IntOut y;
equation
  y = 11;
end AState;

block BState
  IntOut y;
equation
  y = 22;
end BState;

block Sink
  IntIn u;
  output Integer y;
equation
  y = u;
end Sink;

model Study
  AState a;
  BState b;
  Sink sink;
  Real ct;
  Integer result;
equation
  ct = sample(time, Clock(1, 1));
  initialState(a);
  transition(a, b, ct >= 1, reset = false);
  connect(a.y, sink.u);
  connect(b.y, sink.u);
  result = sink.y;
end Study;
