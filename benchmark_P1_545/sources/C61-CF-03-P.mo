connector SignalPort
  Real s;
  flow Real q;
end SignalPort;
model Receiver
  SignalPort p;
end Receiver;
model Wrapper
  SignalPort boundary;
  Receiver n1;
  Receiver n2;
equation
  connect(n2.p,n1.p);
  connect(n1.p,boundary);
end Wrapper;
model Study
  Wrapper w;
end Study;
