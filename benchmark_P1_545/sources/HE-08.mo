model Base
  parameter Real p(start = 17) = 2;
  parameter Real q = 2*p;
end Base;
model Mid
  extends Base(p = 4);
end Mid;
model Study
  extends Mid(q = 5);
  parameter Real r = p*q;
end Study;
