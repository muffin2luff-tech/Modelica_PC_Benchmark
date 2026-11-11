model Consumer
  outer Real signal;
  Real y = signal;
end Consumer;

model Layer
  inner outer Real signal = 1 + signal + 2;
  Consumer c;
  Real y = c.y;
end Layer;

model Study
  inner Real signal = 10;
  Layer layer;
  Real result = layer.y;
end Study;
