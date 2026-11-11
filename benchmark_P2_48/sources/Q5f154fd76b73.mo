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
  connect(a[1], b[1]);
  connect(a[2], b[2]);
  Connections.uniqueRoot(b.r, "roots");
  a[1].r = 1;
  a[2].r = 2;
  result = 10*(if Connections.isRoot(a[1].r) then 1 else 0)
         + (if Connections.isRoot(a[2].r) then 1 else 0);
end Study;
