function similarity = cosine_similarity(A, B)
    % Compute the cosine similarity between two column vectors.
    A /= max(abs(A)); % normalize A
    B /= max(abs(B)); % normalize B
    similarity = sum(A .* B) / (norm(A, 2) * norm(B, 2)); % compute similarity
end
