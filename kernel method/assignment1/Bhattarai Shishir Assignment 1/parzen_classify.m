function y_pred = parzen_classify(ktrain_train, ktrain_test, y)
  index_pos = find(y == 1);
  index_neg = find(y == -1);
  b_pos = 0;
  b_neg = 0;
  

  b_pos = sum(sum(ktrain_train(index_pos, index_pos),1)) ./ (2 * length(index_pos).^2);
  
  b_neg = sum(sum(ktrain_train(index_neg, index_neg),1)) ./ (2 * length(index_neg).^2);
  
  b = b_neg - b_pos;
  
  
  [n, m] = size(ktrain_test');
  
  alpha = ones(m, 1) ./ length(index_pos);
  alpha(index_neg) = -1./ length(index_neg);
 
  y_pred = sign((alpha' * ktrain_test) + b);
  
end
