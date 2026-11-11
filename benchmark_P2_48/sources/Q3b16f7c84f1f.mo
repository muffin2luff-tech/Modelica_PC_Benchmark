model Study
  Integer intervalCounter(start = 2);
  Real result(start = 0);
equation
  when Clock(intervalCounter = intervalCounter, resolution = 1) then
    result = 0 + interval();
    intervalCounter = 1 + previous(intervalCounter);
  end when;
end Study;
