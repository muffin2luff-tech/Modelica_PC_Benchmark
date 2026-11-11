model Consumer
  outer Real signal;
  Real y = signal;
end Consumer;
model Layer
  outer Real signal;
  Consumer c;
  Real y = c.y;
end Layer;
model Study
  inner Real signal = 10;
  Layer layer;
  Real result = layer.y;
end Study;
