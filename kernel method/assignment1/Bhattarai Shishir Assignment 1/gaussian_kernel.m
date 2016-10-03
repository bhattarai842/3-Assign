function K = gaussian_kernel(X, Z, sigma)
  [n, d] = size(X);
  [m, d] = size(Z);
  K = zeros(n, m);
  for i = 1:n
    x = X(i,:);
    individual_term = sum(bsxfun(@minus, Z, x).^2, 2);
    K(i,:) = individual_term';
  end
  K = exp(K ./ (-2 * sigma *sigma));
end
