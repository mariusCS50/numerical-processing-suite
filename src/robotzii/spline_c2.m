function coef = spline_c2 (x, y)
    % si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

    n = numel(x) - 1;
    A = zeros(4 * n);
    row = 1;

	% si(xi) = yi, i = 0 : n - 1
    for i = 0 : n - 1
        A(row++, 4*i + 1) = 1;
    endfor

	% s_n-1(xn) = yn
    x_diff = x(n + 1) - x(n);
    A(row++, end - 3 : end) = x_diff .^ (0 : 3);

	% si(x_i+1) = s_i+1(x_i+1), i = 1 : n - 1
    for i = 1 : n - 1
        x_diff = x(i + 1) - x(i);
        A(row, 4*i - 3: 4*i) = x_diff .^ (0 : 3);
        A(row++, 4*i + 1) = -1;
    endfor

	% si'(x_i+1) = s_i+1'(x_i+1), i = 1 : n - 1
    for i = 1 : n - 1
        x_diff = x(i + 1) - x(i);
        A(row, 4*i - 2: 4*i) = (x_diff .^ (0 : 2)) .* (1 : 3);
        A(row++, 4*i + 2) = -1;
    endfor

	% si''(x_i+1) = s_i+1''(x_i+1), i = 1 : n - 1
    for i = 1 : n - 1
        x_diff = x(i + 1) - x(i);
        A(row, 4*i - 1 : 4*i) = (x_diff .^ (0 : 1)) .* [2, 6];
        A(row++, 4*i + 3) = -2;
    endfor

	% s0''(x0) = 0
    A(row++, 3) = 2;

	% s_n-1''(x_n) = 0
    x_diff = x(n + 1) - x(n);
    A(row, end - 1 : end) = (x_diff .^ (0 : 1)) .* [2, 6];

	% Solve the system of equations
    b = zeros(4*n , 1);
    b(1 : numel(y)) = y;

    coef = A \ b;
end