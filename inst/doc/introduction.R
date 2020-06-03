## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(roxytest)

## ---- include = FALSE---------------------------------------------------------
knitr::knit_engines$set(roxy = function(options) {
  code <- paste(options$code, collapse = '\n')
  code <- paste0(
    "# ----------------------------------------------------\n",
    "# The code example below....\n", 
    "# ----------------------------------------------------\n",
    "\n",
    code
  )

  #out <- knitr::knit_child(text = options$code)
  out <- roxygen2::roc_proc_text(testthat_roclet(), code)
  out <- unlist(lapply(out, function(l) l[["<text>"]]))
  out <- paste0(out, collapse = "\n")
  #out <- out$tests[["<text>"]]
  out <- paste0(
    "\n",
    "# ----------------------------------------------------\n",
    "# ...will result in a generated file in tests/ folder:\n", 
    "# ----------------------------------------------------\n",
    "\n",
    out)

  # To get syntax highlight
  options$engine <- "r"
  options$comment <- NA
  knitr::engine_output(options, code, out)
})

