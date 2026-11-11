model Base
  parameter Real a = 2;
  parameter Real b = a + 1;
end Base;
model Inner
  extends Base;
  parameter Real c = b + b;
end Inner;
model Mid
  parameter Real scale = 3;
  Inner left(a = scale);
  Inner right(a = scale + 2);
end Mid;
model Study
  Mid m(scale = 4);
end Study;
