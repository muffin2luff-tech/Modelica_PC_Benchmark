connector Pin
  Real v;
  flow Real i;
end Pin;
model Branch
  Pin p;
  Pin n;
end Branch;
model Study
  Pin boundary;
  Branch L;
  Branch G;
  Branch C2;
  Branch Nr;
equation
  connect(boundary, L.p);
  connect(G.p, C2.p);
  connect(G.n, Nr.p);
  connect(boundary, G.p);
end Study;
