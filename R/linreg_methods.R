# linreg methods gathered

#' Print for a linreg object
#'
#' Prints the regression coefficients of a linreg object
#'
#' @param x An object of class linreg
#' @param ... Additional arguments to be passed to the print method
#'
#' @returns Invisibly the linreg object
#' @export
#'
print.linreg <- function(x, ...){
  # cat("Linear regression call:\n")
  # print(x$formula)

  print(x$call_arg)

  # create a coefficints table
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
#' @param object An object of class linreg
#' @param ... Additional arguments to be passed to the print method
#'
#' @returns linreg object residuals as the difference between predicted and actual response values
#'
#' @importFrom stats resid
#' @export
#'
resid.linreg <-  function(object, ...){
  return(object$e_hat)
}


#' Predicted values for a linreg object
#'
#' @param object A linreg object
#'
#' @returns linreg object predicted values
#' @export
#'
pred.linreg <-  function(object){
  return(object$y_hat)
}


#' Regression coefficients for a linreg object
#'
#' @param object An object of class linreg
#' @param ... Additional arguments to be passed to the print method
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
