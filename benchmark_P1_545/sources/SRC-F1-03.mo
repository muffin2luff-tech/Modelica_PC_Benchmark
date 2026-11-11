connector Pin
  Real v;
  flow Real i;
end Pin;
model ShortBranch
  Pin p;
  Pin n;
equation
  p.v = n.v;
  p.i + n.i = 0;
end ShortBranch;
model Study
  ShortBranch wire;
end Study;
