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
  Port a[2];
  Port b[2];
  Integer result;
equation
  connect(b[1], a[1]);
  connect(b[2], a[2]);
  Connections.uniqueRoot(a[1].r, "roots");
  Connections.uniqueRoot(a[2].r, "roots");
  a[2].r = 2;
  a[1].r = 1;
  result = (if Connections.isRoot(a[2].r) then 1 else 0)
         + 10*(if Connections.isRoot(a[1].r) then 1 else 0);
end Study;
