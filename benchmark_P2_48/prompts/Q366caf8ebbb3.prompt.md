# Q366caf8ebbb3

```modelica
type Ref
  extends Real;
  function equalityConstraint
    input Ref a;
    input Ref b;
    output Real residue[0];
  algorithm
    residue := fill(0.0, 0);
  end equalityConstraint;
end Ref;

connector Port
  Ref r;
end Port;

model Study
  Port a;
  Port b;
  Real result;
equation
  connect(b, a);
  Connections.potentialRoot(b.r, priority = 1);
  Connections.potentialRoot(a.r, priority = 2);
  if Connections.isRoot(a.r) then
    a.r = 10;
  else
    b.r = 20;
  end if;
  result = if Connections.isRoot(a.r) then 10 else 20;
end Study;
```

What is the exact value of Study.result? Return an integer or a reduced fraction.
