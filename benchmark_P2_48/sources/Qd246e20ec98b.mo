model Study
  parameter Integer A[3, 3] = [1, 2, 3; 4, 5, 6; 7, 8, 9];
  parameter Integer v[3] = A[2];
  parameter Integer result = 100*v[1] + 10*v[2] + v[3];
end Study;
