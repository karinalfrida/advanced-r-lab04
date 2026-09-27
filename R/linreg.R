
#' linreg(formula, data)
#'
#' @param formula A linear regression in the form  y ~ var1 + var2 ...
#' @param data A data frame on which the regression will be done
#'
#' @returns A linreg object
#'
linreg <- function(formula, data){

  ### extract model
  # create a model/design matrix from the formula and data
  X <- model.matrix(formula, data) # independent variables

  # extract the depedent variable from data using formula names
  y_name <- all.vars(formula)[1]
  y <- data[[y_name]]

  ### calculate multiple linear regression statistics
  # beta_hat = regression coefficients (ordinary linear algebra)
  Xt <- t(X)
  XtX_inv <- solve(Xt %*% X)
  beta_hat <- XtX_inv %*% Xt %*% y

  # y_hat = fitted values
  y_hat <-  X %*% beta_hat

  # e_hat = residuals
  e_hat <- y - y_hat

  # degrees of freedom
  df <-  nrow(X) - ncol(X)

  # sigma_hat_squared = residual variance
  sigma_hat_squared <-
    ((t(e_hat) %*% e_hat)/df) |>
    as.numeric()

  # beta_hat_var = variance of regression coefficients (ordinary linear algebra)
  beta_hat_var <-
    (sigma_hat_squared * XtX_inv)|> # variance-coariance matrix
    diag() |> # extracting variances
    as.numeric()


  # t_values = t values for the regression coefficients
  t_values <-
    (beta_hat / sqrt(beta_hat_var))|>
    as.numeric()

  # p_values = p values for the regression coefficients
  p_values <- pt(t_values, df= df)

  ### create a linreg object
  linreg_obj <-
    structure(
      list(
        formula = formula,
        X = X,
        y = y,
        y_name = y_name,
        beta_hat = beta_hat,
        y_hat = y_hat,
        e_hat = e_hat,
        df = df,
        sigma_hat_squared = sigma_hat_squared,
        beta_hat_var = beta_hat_var,
        t_values = t_values,
        p_values = p_values),
      class = "linreg")

  return(linreg_obj)
}

