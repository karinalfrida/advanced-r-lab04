  ### calculate multiple linear regression statistics (QR decomposition)
  qr_results <- linreg_qr(X, y)
  beta_hat <- qr_results$beta_hat
  beta_hat_var <- qr_results$beta_hat_var

  # extract additional results from qr_results
  y_hat <- qr_results$y_hat
  e_hat <- qr_results$e_hat
  df <- qr_results$df
  sigma_hat_squared <- qr_results$sigma_hat_squared