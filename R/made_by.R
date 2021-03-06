# Adapted from roxygen2:::{made_by_roxygen, check_made_by}
made_by_roxytest <- function(path) {
  if (!file.exists(path)) {
    return(TRUE)
  }
  
  # FIXME:
  # testfiles: prefix test-roxytest-*.R
  
  first <- readLines(path, n = 1, encoding = "UTF-8", warn = FALSE)
  
  if (length(first) == 0L) {
    return(FALSE)
  }
  
  made_by_me <- grepl("^. Generated by roxytest", first)
  
  return(made_by_me)
}
