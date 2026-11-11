model SignalSource
end SignalSource;
model Trapezoid
  extends SignalSource;
  parameter Real rising = 0;
  parameter Real width = 1 / 2;
  parameter Real falling = 0;
  parameter Real T_rising = rising;
  parameter Real T_width = T_rising + width;
  parameter Real T_falling = T_width + falling;
end Trapezoid;
model Study
  extends Trapezoid(rising = 2, width = 3, falling = 5);
end Study;
