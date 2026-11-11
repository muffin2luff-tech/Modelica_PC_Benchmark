model Resistor
  parameter Real R = 5;
  parameter Real T_ref = 300;
  parameter Real alpha = 1 / 100;
  parameter Real T = T_ref;
  parameter Real actual = R * ( 1 + alpha * ( T - T_ref ) );
end Resistor;
model Study
  parameter Real ambient = 290;
  Resistor device(R = 12, T_ref = ambient, T = ambient + 20, alpha = 1 / 50);
end Study;
