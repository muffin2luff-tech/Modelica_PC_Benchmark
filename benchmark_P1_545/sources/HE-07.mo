model Left
  parameter Real a = 2;
  parameter Real b = 3*a;
end Left;
model Right
  parameter Real c = 3;
  parameter Real d = 2*c;
end Right;
model Mid
  extends Left(a = 4);
  extends Right(c = 5);
  parameter Real e = b + d;
end Mid;
model Study
  extends Mid(a = 6, c = 7);
  parameter Real f = e - a;
end Study;
