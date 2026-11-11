model PartialFrictionWithStop
  parameter Real smax(start = 25) = 30;
  parameter Real smin(start = - 25) = - 25;
end PartialFrictionWithStop;
model MassWithStopAndFriction
  extends PartialFrictionWithStop;
  parameter Real m(start = 1) = 1;
end MassWithStopAndFriction;
model CalibratedMass
  extends MassWithStopAndFriction;
end CalibratedMass;
model Study
  extends CalibratedMass;
end Study;
