connector Port
  Integer p;
  flow Integer f;
end Port;

model Study
  Port a;
  Port b;
  Integer result;
equation
  connect(a, b);
  a.p = 0;
  a.f = 7;
  result = b.f;
end Study;
