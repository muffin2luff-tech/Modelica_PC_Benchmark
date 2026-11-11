model Study
  Real u;
  Real x(start = 0);
  Real result;
equation
  u = 5 + (if time < 1 then 0 else 4);
  x = sample(u + 0, Clock(1, 1));
  result = hold(x);
end Study;
