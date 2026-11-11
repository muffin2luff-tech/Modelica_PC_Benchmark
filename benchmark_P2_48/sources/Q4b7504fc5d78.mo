model Study
  Real relationValue;
equation
  relationValue = if time >= 1 then 1.0 else 0.0;
end Study;
