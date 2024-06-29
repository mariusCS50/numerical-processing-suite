function [x, y] = parse_data(filename)
    file = fopen(filename, 'rt');

    n = fscanf(file, '%d', 1); % read n
    x = fscanf(file, '%d', n + 1); % read vector x
    y = fscanf(file, '%d', n + 1); % read vector y

    fclose(file);
end