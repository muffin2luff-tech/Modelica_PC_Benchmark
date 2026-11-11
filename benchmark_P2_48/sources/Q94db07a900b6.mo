connector SignalIn = input Real;
connector SignalOut = output Real;
model Emitter
  parameter Real level;
  SignalOut y;
equation
  y = level;
end Emitter;
model Stage
  SignalIn u;
  SignalOut y;
equation
  y = u;
end Stage;
model Parent
  Emitter feed[2](level = {3, 8});
  Stage stage[2];
equation
  for i in 1:2 loop
    connect(feed[i].y, stage[i].u);
  end for;
end Parent;
model Study
  extends Parent(break connect(feed[1].y, stage[1].u));
  Real result;
equation
  connect(feed[2].y, stage[1].u);
  connect(feed[2].y, stage[2].u);
  result = 10*stage[1].y + stage[2].y;
end Study;
