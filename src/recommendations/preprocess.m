function reduced_mat = preprocess(mat, min_reviews)
    % Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
    client_review_counts = sum(mat > 0, 2); % get the number of reviews for each client
    good_clients = (client_review_counts >= min_reviews); % select the good clients
    reduced_mat = mat(good_clients, :); % keep only the good clients
end
