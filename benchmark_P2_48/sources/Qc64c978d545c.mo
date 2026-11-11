model Study
  Integer intervalCounter(start = 2);
  Real result(start = 0);
equation
  when Clock(intervalCounter, 1) then
    intervalCounter = previous(intervalCounter) + 1;
    result = intervalCounter;
  end when;
end Study;
