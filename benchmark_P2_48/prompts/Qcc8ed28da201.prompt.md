# Qcc8ed28da201

```modelica
model Study
  Real relationValue;
equation
  relationValue = if noEvent(not (time < 1)) then 1.0 else 0.0;
end Study;
```

At the crossing at t = 1 s, does the relation itself require a state or time event under Modelica 3.7? Return exactly `EVENT` or `NO_EVENT`.
