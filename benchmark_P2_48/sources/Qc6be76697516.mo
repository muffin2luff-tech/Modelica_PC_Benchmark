model Study
  discrete Integer first(start = 0, fixed = true);
  discrete Integer second(start = 0, fixed = true);
  Integer result;
equation
  when time >= 1 then
    first = 1;
  end when;
  when time >= 2 then
    second = 1;
  end when;
  result = first + second;
end Study;
