#' @importFrom cli cli_alert_success
#' @importFrom utils packageVersion
#' @title test this package
#' @description
#' This package tests the presence and functionality of cli and glue
#' @return NA
#' @export

test_package <- function() {
  cli_flag <- tryCatch({
    cli_ver <- packageVersion("cli")
    TRUE
  }, error = function(e) {
    FALSE
  })

  glue_flag <- tryCatch({
    glue_ver <- packageVersion("glue")
    TRUE
  }, error = function(e) {
    FALSE
  })

  if (cli_flag && glue_flag) {
    cli::cli_alert_success("cli={cli_ver} and glue={glue_ver} installed!")
    return(invisible())
  } 
  if (cli_flag) {
    cli::cli_alert_success(sprintf("cli=%s installed!", cli_ver))
    cli::cli_alert_danger(sprintf("glue not installed"))
    return(invisible())
  }
  if (glue_flag) {
    print(glue::glue("glue={glue_ver} installed"))
    print("cli not installed")
    return(invisible())
  }
  print("glue and cli not installed")
}