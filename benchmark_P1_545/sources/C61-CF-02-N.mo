connector Port
  Real e;
  flow Real f;
end Port;
model Leaf
  Port p;
end Leaf;
model Hub
  Port left;
  Port right;
  Leaf a;
  Leaf b;
  Leaf extra;
equation
  connect(left,a.p);
  connect(a.p,extra.p);
  connect(extra.p,right);
end Hub;
model Study
  Hub h;
end Study;
