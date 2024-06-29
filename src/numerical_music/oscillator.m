function x = oscillator(freq, fs, dur, A, D, S, R)
    t = 0 : 1 / fs : dur - 1 / fs; % create the time vector
    sine_wave = sin(2 * pi * freq * t)'; % create the sine wave

    all_samples = floor((A + D + S + R) * fs);
    A_samples = floor(A * fs); % attack samples
    D_samples = floor(D * fs); % decay samples
    R_samples = floor(R * fs); % release samples
    S_samples = all_samples - (A_samples + D_samples + R_samples); % sustain samples

    A_envelope = linspace(0, 1, A_samples); % attack envelope
    D_envelope = linspace(1, S, D_samples); % decay envelope
    S_envelope = linspace(S, S, S_samples); % sustain envelope
    R_envelope = linspace(S, 0, R_samples); % release envelope

    % concatenate all the envelopes to get the ADSR envelope
    envelope = [A_envelope, D_envelope, S_envelope, R_envelope];
    x = zeros(numel(sine_wave), 1);
    % apply the amplitude modulation
    x(1 : numel(envelope)) = sine_wave(1 : numel(envelope)) .* envelope';
endfunction