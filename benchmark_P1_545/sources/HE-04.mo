model Left
  parameter Real p = 2;
end Left;
model Right
  parameter Real q = 3;
end Right;
model Study
  extends Left(p = 4);
  extends Right(q = 5);
  parameter Real r = p * q;
end Study;
