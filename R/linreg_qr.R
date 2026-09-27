




linreg_qr <- function(X, y) {
    # Decompose X into Q and R
    qr_X <- qr(X)
    Q <- qr.Q(qr_X)
    R <- qr.R(qr_X)

    # Compute Q^T * y
    # QTy <- t(Q) %*% y
    QTy <- crossprod(Q, y) # Same thing as t(Q) %*% y

    # beta_hat: X = QR  =>  R beta = Q^T y, solved by back-substitution
    beta_hat <- backsolve(R, QTy)
    rownames(beta_hat) <- colnames(X)

    # fitted values and residuals, df
    yhat <- X %*% beta_hat
    e_hat <- y - yhat
    df <- nrow(X) - ncol(X)

    # estimate of variance
    sigma_hat_squared <- sum(e_hat^2) / df

    # Compute XtX_inv using the QR decomposition
    R_inv <-  backsolve(
        R, 
        diag(ncol(X))
    )
    XtX_inv <- tcrossprod(R_inv)

    # Variance of beta_hat
    beta_hat_var <- sigma_hat_squared * diag(XtX_inv)

    # return results as a list
    return(
        list(beta_hat = beta_hat, beta_hat_var = beta_hat_var,
        sigma_hat_squared = sigma_hat_squared, df = df)
    )

}
