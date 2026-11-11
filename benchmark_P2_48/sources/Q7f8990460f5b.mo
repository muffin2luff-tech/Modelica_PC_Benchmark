block StateA
end StateA;
block StateB
end StateB;
model Study
  StateA a;
  StateB b;
  Real ct;
  Integer result;
equation
  ct = sample(time, Clock(1, 1));
  initialState(a);
  transition(a, b, ct > 100, reset = false);
  result = ticksInState();
end Study;
