function Pick
  output Integer y;
protected
  Integer v[1];
algorithm
  v := {0};
  v[1] := 2;
  v[1] := 3;
  y := v[1];
end Pick;
model Study
  Integer result = Pick();
end Study;
