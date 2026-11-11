type Count = Integer;
connector Port
  Integer p;
  flow Count f;
end Port;
model Study
  Port a; Port b; Integer result;
equation
  connect(b,a);
  a.p = 0;
  a.f = 7;
  result = b.f;
end Study;
