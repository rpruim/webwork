
#' Roster utilities
#'
#' @param email Email address (may be left blank).
#' @param user User IDs (required).
#' @param id Student IDs (may be left blank).
#' @param last_name Last name (may be left blank).
#' @param first_name First name (may be left blank).
#' @param password Passwords (defaults to `student_id`).
#' @param permission Permission code: Use -5 for guest, 0 for student, 2 for login proctor, 3for grade proctor, 5 for teaching assistant, 10 for professor.
#' @param status One of `"current"`, `"enrolled"`, `"audit"`, `"drop"`.  (Can use c/a/d.)
#' @param comment A comment (may be left blank).
#' @param section Section desriptor (may be left blank).
#' @param recitation Recitaiton descriptor (may be left blank).
#' @importFrom dplyr data_frame
#' @export

ww_roster <-
  function(
    email = "",
    user = sapply(stringr::str_split(email, "@"), function(x) x[1]),
    id = "",
    last_name = "",
    first_name = "",
    password = id,
    permission = 0,
    status = "current",
    comment = "",
    section = "",
    recitation = ""
  ) {

    dplyr::data_frame(
      student_id = id,
      last_name	= last_name,
      first_name = first_name,
      status = status,
      comment	= comment,
      section	= section,
      recitation = recitation,
      email_address	= email,
      user_id	= user,
      password = crypt(password),
      permission = permission)
  }


