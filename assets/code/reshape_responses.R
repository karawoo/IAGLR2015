# Reshape responses
#
#' This function reshapes data from the ice workshop survey. It separates
#' answers on commas and semicolons, optionally leaving intact any answers that
#' are write-ins at the end of a multiple choice question (i.e. the answer to
#' the question about what types of observational in situ data respondents
#' have -- there were a number of checkboxes followed by a space for a write-in.
#' Specifying the `choices` arg and writeins = TRUE splits up the multiple
#' choice answers but leaves write-ins with commas and semicolons intact
#' (though it converts the semicolons to commas...because I am too lazy to
#' change that)). 
#' @param data data frame containing the responses
#' @param idcol column of IDs to be grouped on. Defaults to "id" which is 
#' usually what you'd want for this data
#' @param datacol column containing responses to be split up
#' @param choices multiple choice answers to be split up (optional)
#' @param mc was the question multiple choice with a write-in option? Defaults
#' to FALSE
#' 

reshape_responses <- function(data, idcol = "id", datacol, choices, 
                              mc = FALSE) {
  df <- do.call(rbind, lapply(split(data, data[, idcol]), function(x) {
    v <- unlist(strsplit(x[, datacol], ",\\s?|;\\s?"))
    if (mc == TRUE) {
      v <- c(v[v %in% choices], paste(v[!v %in% choices], collapse = ", "))
    } else {
      NULL
    }
    v <- v[nchar(v) > 0]
    if (length(v) > 0) {
      data.frame(id = x[, idcol][1], data = v, stringsAsFactors = FALSE)
    } else {
      NULL
    }
  }))
  row.names(df) <- NULL
  return(df)
}
