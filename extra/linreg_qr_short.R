linreg_qr_short <- function(X, y) {
    # Perform QR decomposition
    qr_X <- qr(X)

    # Coefficients and residuals from the object returned by qr()
    beta_hat <- qr.coef(qr_X, y)
    e_hat <- qr.resid(qr_X, y)

    # Degrees of freedom and estimate of variance
    df <- nrow(X) - ncol(X)
    sigma_hat_squared <- sum(e_hat^2) / df

    # Compute XtX_inv using inverse of R matrix
    XtX_inv <- qr.R(qr_X) |>
    chol2inv()

    # Variance of beta_hat
    beta_hat_var <- sigma_hat_squared * diag(XtX_inv)

    return(
        list(beta_hat = beta_hat, beta_hat_var = beta_hat_var,
        sigma_hat_squared = sigma_hat_squared, df = df)
    )
}

