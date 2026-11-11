model Base
  parameter Real n;
  parameter Real bias = 1;
  parameter Real score = n + bias;
end Base;

model ImplA
  extends Base;
  parameter Real extra = 2;
end ImplA;

model ImplB
  extends Base;
  parameter Real extra = 4;
end ImplB;

model Holder
  replaceable ImplA comp constrainedby Base(n = 5);
end Holder;

model Mid
  extends Holder(redeclare replaceable ImplB comp(bias = 3));
end Mid;

model Study
  extends Mid(redeclare ImplA comp(extra = 7));
  parameter Real result = comp.score;
end Study;
