function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

	% Calcualte y_interp using the Vandermonde coefficients
    for i = 1 : numel(x_interp)
        y_interp(i) = sum((x_interp(i) .^ (0 : numel(coef) - 1)) .* coef');
    endfor
end
