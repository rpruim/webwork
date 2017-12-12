
#' Ingest WeBWorK gradebook
#'
#' @param path Path to gradebook file exported from WeBWorK
#' @export
#' @importFrom utils read.csv

ww_read_gradebook <- function(path) {
  raw <-
    as.matrix(
      read.csv(path, header = FALSE, stringsAsFactors = FALSE)
    )
  gradebook <-
    read.csv(path, skip = 7, header = FALSE, stringsAsFactors = FALSE)
  gradebook <-
    rbind(gradebook, as.numeric(raw[6,]))
  names(gradebook) <- ifelse (nchar(raw[2, ]) > 0, raw[2, ], names(gradebook))
  names(gradebook)[1:6] <- c("student_id", "login_id", "last", "first", "section", "recitation")
  names(gradebook) <- gsub("%", "pct_", names(gradebook))
  gradebook[nrow(gradebook), "first"] <- "Total"
  gradebook[nrow(gradebook), "last"] <- "Possible"
  gradebook
}
