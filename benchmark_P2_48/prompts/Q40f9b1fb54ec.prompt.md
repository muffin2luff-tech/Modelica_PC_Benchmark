# Q40f9b1fb54ec

```modelica
model Consumer
  outer Real signal;
  Real y = signal;
end Consumer;

model Layer
  inner outer Real signal = signal + 3;
  Consumer c;
  Real y = c.y;
end Layer;

model Study
  inner Real signal = 10;
  Layer layer;
  Real result = layer.y;
end Study;
```

What is the exact value of Study.result? Return an integer or a reduced fraction.
