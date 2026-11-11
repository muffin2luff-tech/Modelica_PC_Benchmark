model Study
  Real relationValue;
equation
  relationValue = if noEvent(not (time < 1)) then 1.0 else 0.0;
end Study;
