model Base
  parameter Real a = 2;
  parameter Real b = a + 1;
end Base;
model Mid
  extends Base(a = 4);
end Mid;
model Study
  extends Mid(b = 2 * a);
end Study;
