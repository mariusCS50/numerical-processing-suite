function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1

	% Calculate y_interp using the Spline coefficients
    idx = 1;
    for i = 1 : numel(x_interp)
        % get the index of the polynomyal whose interval includes x_interp(i)
        while (x_interp(i) > x(idx + 1))
            idx++;
        end
        x_diff = x_interp(i) - x(idx); % (x - xi)
        x_coef = coef(4 * idx - 3 : 4 * idx)'; % get coeficients [ai, bi, ci, di]
        y_interp(i) = sum((x_diff .^ (0 : 3)) .* x_coef); % calculate si(x)
    endfor
end
