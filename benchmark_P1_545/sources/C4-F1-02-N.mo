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
  connect(L.p, G.p);
  connect(G.n, Nr.p);
end Study;
