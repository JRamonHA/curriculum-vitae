oral_section <- function(xlsx = "data/cv.xlsx", sheet = "oral", page_break_after = FALSE, colour = "#333333") {
  text <- read_excel_sheet(xlsx, sheet)[
    i = .N:1,
    j = sprintf(
      "### %s\n\n%s\n\nN/A\n\n<p class=\"date\">%s</p>\n\n",
      title, organiser, date
    )
  ]
  
  if (page_break_after) {
    c(sprintf("## Oral communications  {data-icon=comment-dots .break-after-me}"), text)
  } else {
    c(sprintf("## Oral communications {data-icon=comment-dots}"), text)
  }
}
