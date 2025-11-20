#' Summarize a Linear Relationship
#'
#' Fits a simple linear regression between two numeric variables and returns
#' the slope, intercept, and R-squared in a tidy tibble.
#'
#' @param data A data frame that holds the variables. I called it `data`
#' because it’s a clear name for the dataset input.
#' @param x Name of the predictor variable. I used `x` because
#' it usually represents the independent variable in most formulas.
#' @param y Name of the response variable. I used `y` because
#' it commonly represents the dependent variable in regression.
#'
#' @return A tibble with columns for predictor, response, slope, intercept, and r_squared.
#'
#' @examples
#' linear_summary(mtcars, "hp", "mpg")
#' linear_summary(iris, "Sepal.Length", "Petal.Length")
#'
#' @export

linear_summary <- function(data, x, y) {

  if (!all(c(x, y) %in% names(data))) {
    stop("Columns not found.")
  }

  if (!is.numeric(data[[x]]) || !is.numeric(data[[y]])) {
    stop("Columns must be numeric.")
  }

  model <- lm(data[[y]] ~ data[[x]])
  summary_info <- summary(model)

  tibble::tibble(
    predictor = x,
    response = y,
    slope = unname(coef(model)[2]),
    intercept = unname(coef(model)[1]),
    r_squared = unname(summary_info$r.squared)
  )
}
