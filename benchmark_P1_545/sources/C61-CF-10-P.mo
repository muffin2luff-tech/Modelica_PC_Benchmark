connector Port
  Real e;
  flow Real f;
end Port;
model Leaf
  Port p;
end Leaf;
model TargetHub
  Port anchor;
  Leaf a;
  Leaf b;
equation
  connect(b.p,a.p);
  connect(a.p,anchor);
end TargetHub;
model DistractorHub
  Port anchor;
  Leaf a;
  Leaf b;
equation
  connect(anchor,a.p);
  connect(a.p,b.p);
end DistractorHub;
model Study
  TargetHub targetHub;
  DistractorHub distractor;
end Study;
