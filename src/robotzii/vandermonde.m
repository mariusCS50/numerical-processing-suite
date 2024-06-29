function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % Calculate the Vandermonde coefficients
    n = numel(x);
    for i = 1 : n
        A(i, :) = x(i) .^ (0 : n - 1);
    endfor

    coef = A \ y;
endfunction
