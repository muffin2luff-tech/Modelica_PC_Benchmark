model Inner
  parameter Real k = 2;
end Inner;
model Outer
  Inner i(k = 3);
end Outer;
model Study
  Outer o;
end Study;
