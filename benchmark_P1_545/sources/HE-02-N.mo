model Base
  parameter Real a = 2;
  parameter Real b = 3 * a;
end Base;
model Study
  extends Base(a = 6);
end Study;
