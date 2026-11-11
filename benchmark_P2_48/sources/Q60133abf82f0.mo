block StateA
  output Integer status;
equation
  status = ticksInState();
end StateA;
model Study
  StateA a;
  Integer result;
equation
  result = a.status;
end Study;
