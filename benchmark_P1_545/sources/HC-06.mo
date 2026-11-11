model Gain
  parameter Real k = 1;
  parameter Real outValue = 2 * k;
end Gain;
model Stage
  parameter Real scale = 3;
  Gain left(k = scale + 1);
  Gain right(k = 2 * scale);
end Stage;
model Study
  Stage s(scale = 4);
end Study;
