#' Create crypted passwords
#'
#' Create cypted passwords for use with WeBWorK class lists.
#'
#' @rdname crypt
#' @param plaintext Plain text to be hashed
#' @param salt Currently ignored.  Salt is generated randomly.
#'
#' @export
crypt1 <- function(plaintext, salt = NULL ) {

  if (is.null(salt)) {
    characters <- c(LETTERS, letters, format(0:9), ".", "/")
    salt <- paste0(characters[sample(seq_along(characters), size = 2, replace = TRUE)], collapse = "")
  }

  # From WeBWorK:
  #
  # To crypt a password, use the following perl one-liner:
  #
  #   perl -e 'while(1){print"plaintext? ";<>;chomp;print"crypted: ".crypt($_,join"",(".","/",0..9,"A".."Z","a".."z")[rand 64,rand 64])."\n"}'
  #
  # You can also create a classlist file with plaintext passwords, and then use the following perl one-liner to crypt them:
  #
  #   perl -pe '@a=split",";$a[9]and$a[9]=crypt($a[9],join"",(".","/",0..9,"A".."Z","a".."z")[rand 64,rand 64]);$_=join",",@a' < plaintext.lst > crypted.lst
  #

  command <- paste0(
    "perl -e 'print crypt(\"",  plaintext,  "\", \"",  salt,  "\")'"
  )

  system(command, intern = TRUE)
}

#' @export
crypt <- Vectorize(crypt1)
