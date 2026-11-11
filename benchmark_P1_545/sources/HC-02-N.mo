model Gear
  parameter Real ratio = 2;
end Gear;
model Stage
  parameter Real nominal = 4;
  Gear gear(ratio = nominal + 3);
end Stage;
model Study
  Stage s(nominal = 6);
end Study;
