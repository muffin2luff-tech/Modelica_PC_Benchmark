model Study
  discrete Integer first(start = 0, fixed = true);
  discrete Integer second(start = 0, fixed = true);
  Integer result;
equation
  when not (time < 1) then
    first = 1;
  end when;
  when not (first < 1) then
    second = 1;
  end when;
  result = second + first;
end Study;
