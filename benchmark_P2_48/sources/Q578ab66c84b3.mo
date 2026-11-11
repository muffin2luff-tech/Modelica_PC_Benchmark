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
  transition(a, a, ct >= 2 and ct < 3, reset = false);
  result = a.tau;
end Study;
