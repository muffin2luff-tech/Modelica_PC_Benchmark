connector C
  Real e;
  flow Real f;
end C;
model Component
  C c1;
  C c2;
  C c3;
end Component;
model Study
  Component m;
equation
  connect(m.c2, m.c1);
  connect(m.c3, m.c2);
end Study;
