model Planetary
  parameter Real ratio = 2;
  Real carrier;
  Real sun;
  Real ring;
  Real ringTorque;
  Real sunTorque;
  Real carrierTorque;
equation
  ( 1 + ratio ) * carrier = sun + ratio * ring;
  ringTorque = ratio * sunTorque;
  carrierTorque = - ( 1 + ratio ) * sunTorque;
end Planetary;
model Study
  Planetary first;
  Planetary second(ratio = 3);
equation
  first.sun = 9;
  first.ring = 3;
  first.ringTorque = 4;
  second.sun = first.carrier;
  second.ring = 2;
  second.ringTorque = first.carrierTorque;
end Study;
