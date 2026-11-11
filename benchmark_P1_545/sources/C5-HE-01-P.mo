model ThermBase
  parameter Real nominal = 2;
  parameter Real scale = nominal + 1;
  parameter Real residual = 2 * scale - nominal;
end ThermBase;
model Tune
  extends ThermBase(nominal = 4);
end Tune;
model Study
  extends Tune(nominal = 6);
  parameter Real outValue = scale * residual - nominal;
end Study;
