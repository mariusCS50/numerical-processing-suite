function signal = low_pass(signal, fs, cutoff_freq)
    fourrier = fft(signal); % compute the FT

    % compute all possible frequencies of the signal
    signal_length = numel(signal);
    freq_step = fs / signal_length;
    f = ((0 : signal_length - 1) * freq_step);

    % Create a vector mask for frequencies lower than the cutoff frequency
    mask = (f <= cutoff_freq)';
    fourrier .*= mask; % apply the  Hadamard product between FT and mask

    signal = ifft(fourrier); % compute the inverse FT to get the filtered signal
    signal /= max(abs(signal)); % normalize the filtered signal
endfunction