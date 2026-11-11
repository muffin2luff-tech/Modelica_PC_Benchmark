block AState
  output Real tau;
equation
  tau = timeInState();
end AState;
model Study
  AState a;
  Real ct;
  Real result;
equation
  ct = sample(time, Clock(1, 1));
  initialState(a);
  transition(a, a, ct > 1.5 and ct < 2.5, reset = false);
  result = a.tau;
end Study;
