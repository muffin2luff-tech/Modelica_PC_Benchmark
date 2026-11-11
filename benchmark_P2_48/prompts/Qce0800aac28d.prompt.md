# Qce0800aac28d

```modelica
model Study
  Integer intervalCounter(start = 2);
  Real result(start = 0);
equation
  when Clock(intervalCounter, 1) then
    intervalCounter = previous(intervalCounter) + 1;
    result = interval();
  end when;
end Study;
```

What is the exact value of Study.result immediately after the second clock activation at t = 3 s? Return an integer or a reduced fraction.
