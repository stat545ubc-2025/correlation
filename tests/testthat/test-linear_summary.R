test_that("linear_summary works correctly on a perfect linear relationship", {

  df1 <- tibble::tibble(x = 1:5, y = 2 * x + 1)
  result <- suppressWarnings(correlation::linear_summary(df1, "x", "y"))

  expect_equal(result$slope, 2, tolerance = 1e-8)
  expect_equal(result$intercept, 1, tolerance = 1e-8)
  expect_equal(result$r_squared, 1, tolerance = 1e-8)#r_squared should be 1 since it's predecting prefectly
})

test_that("linear_summary handles NA values properly", {

  df2 <- tibble::tibble(x = c(1, 2, 3, 4, NA),
                        y = c(2, 4, 6, 8, 10))

  result <- suppressWarnings(correlation::linear_summary(df2, "x", "y"))

  df2_clean <- df2[complete.cases(df2), ]
  expected <- suppressWarnings(correlation::linear_summary(df2_clean, "x", "y"))

  expect_equal(result$slope, expected$slope, tolerance = 1e-8)
  expect_equal(ncol(result), 5)
  expect_s3_class(result, "tbl_df")
})

test_that("linear_summary throws an error for non-numeric input", {

  df3 <- tibble::tibble(x = c("a", "b", "c"), y = c(1, 2, 3))

  expect_error(correlation::linear_summary(df3, "x", "y"),
               "Columns must be numeric")
})
