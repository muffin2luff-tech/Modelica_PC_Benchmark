# Q59314fb9cfba

```modelica
function Pick
  output Integer y;
protected
  Integer v[1];
algorithm
  v := {0};
  v[{1,1}] := {2,3};
  y := v[1];
end Pick;

model Study
  Integer result = Pick();
end Study;
```

What is the exact value of Study.result after the initialization algorithm completes? Return an integer.
