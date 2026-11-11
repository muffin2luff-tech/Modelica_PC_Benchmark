model Study
  Real u;
  Real x(start = 0);
  Real result;
equation
  u = if time < 1 then 5 else 9;
  x = sample(u, Clock(1, 1));
  result = hold(x);
end Study;
