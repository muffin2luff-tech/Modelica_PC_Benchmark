connector Port
  Integer p;
  flow Boolean f;
end Port;
model Study
  Port a;
  Port b;
  Boolean result;
equation
  connect(a, b);
  a.p = 0;
  a.f = true;
  result = b.f;
end Study;
