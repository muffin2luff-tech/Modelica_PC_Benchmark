model Base
  parameter Real a = 2;
  parameter Real b = a + 1;
end Base;
model Inner
  extends Base;
  parameter Real c = 2*b;
end Inner;
model Mid
  parameter Real scale = 3;
  Inner left(a = scale);
  Inner right(a = scale + 2);
end Mid;
model Study
  Mid m(scale = 5);
end Study;
