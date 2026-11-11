connector Pin
  Real v;
  flow Real i;
end Pin;
model OnePort
  Pin p;
  Pin n;
end OnePort;
model Study
  Pin boundary;
  OnePort device;
equation
  connect(boundary, device.p);
end Study;
