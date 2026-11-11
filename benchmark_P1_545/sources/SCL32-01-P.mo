model PartialCompliantWithRelativeStates
end PartialCompliantWithRelativeStates;
model ElastoBacklash2
  extends PartialCompliantWithRelativeStates;
  parameter Real b = 8;
  parameter Real bMax = b / 2;
  parameter Real bMin = - bMax;
end ElastoBacklash2;
model Study
  extends ElastoBacklash2;
end Study;
