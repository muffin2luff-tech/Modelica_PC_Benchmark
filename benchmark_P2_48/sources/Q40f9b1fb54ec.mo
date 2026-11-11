model Consumer
  outer Real signal;
  Real y = signal;
end Consumer;

model Layer
  inner outer Real signal = signal + 3;
  Consumer c;
  Real y = c.y;
end Layer;

model Study
  inner Real signal = 10;
  Layer layer;
  Real result = layer.y;
end Study;
