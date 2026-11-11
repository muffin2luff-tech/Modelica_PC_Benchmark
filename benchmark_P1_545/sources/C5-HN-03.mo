model Leaf
  parameter Real p = 1;
  parameter Real q = 2;
  parameter Real r = p * q + q;
end Leaf;
model Node
  parameter Real alpha = 2;
  parameter Real beta = 3;
  Leaf left(p = alpha + 1, q = beta);
  Leaf right(p = 2 * alpha, q = alpha + beta);
end Node;
model System
  Node n(alpha = 4, beta = 5);
end System;
model Study
  System s;
end Study;
