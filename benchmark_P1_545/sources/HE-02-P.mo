model Base
  parameter Real a = 2;
  parameter Real b = a + a + a;
end Base;
model Study
  extends Base(a = 5);
end Study;
