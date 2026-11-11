connector Port
  Real e;
  flow Real f;
end Port;
model Leaf
  Port p;
end Leaf;
model InnerNode
  Port port;
end InnerNode;
model DeepContainer
  InnerNode i1;
  InnerNode i2;
  InnerNode i3;
  InnerNode i4;
equation
  connect(i1.port,i3.port);
  connect(i3.port,i2.port);
  connect(i2.port,i4.port);
end DeepContainer;
model Study
  DeepContainer container;
end Study;
