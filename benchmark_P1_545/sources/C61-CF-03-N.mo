connector SignalPort
  Real s;
  flow Real q;
end SignalPort;
model Receiver
  SignalPort p;
end Receiver;
model BoundaryBox
  SignalPort boundary;
end BoundaryBox;
model Study
  BoundaryBox box;
  Receiver n1;
  Receiver n2;
equation
  connect(box.boundary,n1.p);
  connect(n1.p,n2.p);
end Study;
