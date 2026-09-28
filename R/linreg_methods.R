# linreg methods gathered

#' Print for a linreg object
#'
#' Prints the regression coefficients of a linreg object
#'
#' @param x An object of class linreg
#' @param ... Additional arguments for compatibility with generic method
#'
#' @returns Invisibly the linreg object
#' @export
#'
print.linreg <- function(x, ...){
  # cat("Linear regression call:\n")
  # print(x$formula)

  print(x$call_arg)

  # create a coefficients table
  coeffs_table <-
    rbind(
      Estimate = as.vector(x$beta_hat)
    )
  colnames(coeffs_table) <- rownames(x$beta_hat)
  cat("\nCoefficients:\n")
  print(coeffs_table)
  invisible(x)
}

#' Residuals for a linreg object
#'
#' @param object An object of class linreg.
#' @param ... Additional arguments for compatibility with generic method
#'
#' @returns linreg object residuals as the difference between predicted and actual response values
#'
#' @importFrom stats residuals
#' @export
#'
residuals.linreg <-  function(object, ...){ # stat::resid() calls residuals()
  return(object$e_hat)
}

#' Predicted values generic function
#'
#' @param object An object of class linreg.
#' @param ... Additional arguments for compatibility with generic method
#'
#' @export
pred <- function(object, ...) {
  UseMethod("pred") # use linreg method
}

#' Predicted values for a linreg object
#'
#' @param object An object of class linreg.
#' @param ... Additional arguments for compatibility with generic method
#'
#' @returns linreg object predicted values
#' @export
#'
pred.linreg <-  function(object, ...){
  return(object$y_hat)
}


#' Regression coefficients for a linreg object
#'
#' @param object An object of class linreg
#' @param ... Additional arguments for compatibility with generic method
#'
#' @returns linreg object regression coefficients
#'
#' @importFrom stats coef
#' @export
#'
coef.linreg <-  function(object, ...){
  coeffs_table <-
    rbind(
      Estimate = as.vector(object$beta_hat)
    )
  colnames(coeffs_table) <- rownames(object$beta_hat)
  return(coeffs_table)
}


#' Summary of regression results for a linreg object
#'
#' @param object An object of class linreg
#' @param ... Additional arguments for compatibility with generic method
#'
#' @returns Invisibly the linreg object
#'
#' @importFrom stats printCoefmat
#' @export
#'
summary.linreg <-  function(object, ...){
  # call
  print(object$call_arg)

  # results table
  coeffs_table_full <-
    cbind(
      Estimate = as.vector(object$beta_hat),
      SE = sqrt(object$beta_hat_var),
      t_value = object$t_values,
      p_values = object$p_values
    )
  colnames(coeffs_table_full) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  rownames(coeffs_table_full) <- rownames(object$beta_hat)
  cat("\nCoefficients:\n")
  printCoefmat(coeffs_table_full, signif.stars = TRUE)

  # Residual standard error and degrees of freedom
  cat("\nResidual standard error:",
      round(sqrt(object$sigma_hat_squared), digits = 4),
      "on",
      object$df,
      "degrees of freedom")

  invisible(object)
}





