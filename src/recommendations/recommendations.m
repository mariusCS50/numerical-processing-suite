function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
    % Get the best `num_recoms` recommandations similar with 'liked_theme'.

    mat = read_mat(path); % load the matrix
    reduced_map = preprocess(mat, min_reviews); % preprocess the matrix

    [U, S, V] = svds(reduced_map, num_features); % compute the reduced SVD

    % calculate the similarity of all themes with the liked theme
    for i = 1 : length(V)
        theme_similarity(i) = cosine_similarity(V(i, :), V(liked_theme, :));
    endfor

    % sort themes by the simmilarity
    [theme_similarity, recom_ind] = sort(theme_similarity, "descend");

    % return the indices of most recommended themes, excluding the liked theme
    recoms = recom_ind(2 : num_recoms + 1);
end