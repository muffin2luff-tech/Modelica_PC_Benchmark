model SpringDamper
  parameter Real c = 1;
  parameter Real d = 1;
end SpringDamper;
model Study
  SpringDamper springDamper(c = 10000, d = 20);
end Study;
