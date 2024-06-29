function [S f t] = spectrogram(signal, fs, window_size)
    % get the size of the signal and compute the number of windows
    num_windows = floor(numel(signal) / window_size);

    hanning_window = hanning(window_size); % compute the Hann vector
    for i = 1 : num_windows
        left = (i - 1) * window_size + 1;
        right = i * window_size;

        signal(left : right) .*= hanning_window; % hann the current window

        fourier = fft(signal(left : right), window_size * 2); % compute the FT
        fourier = fourier(1 : window_size); % discard the conjugate part of FT

        S(:, i) = abs(fourier); % store the result in the spectrogram matrix
    endfor

    freq_step = (fs / 2) / window_size; % compute the frequency step
    f = ((0 : window_size - 1) * freq_step)'; % compute the frequency vector

    time_step = (window_size / fs); % compute the time step
    t = ((0 : num_windows - 1) * time_step)'; % compute the time vector
endfunction