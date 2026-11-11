model Base
  parameter Real a = 2;
  parameter Real b = 3 * a;
  parameter Real c = b - a;
end Base;
model Mid
  extends Base(a = 4);
  parameter Real d = c + b;
end Mid;
model Study
  extends Mid(a = 6, b = 2 * a + 1);
  parameter Real result = d + c;
end Study;
