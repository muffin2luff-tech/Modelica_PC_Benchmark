model SpringDamper
  parameter Real c = 10000;
  parameter Real d = 1;
end SpringDamper;
model Study
  SpringDamper springDamper(d = 20);
end Study;
