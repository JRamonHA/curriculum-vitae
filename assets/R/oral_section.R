oral_section <- function(xlsx = "data/cv.xlsx", sheet = "oral", page_break_after = FALSE, colour = "#333333") {
  text <- read_excel_sheet(xlsx, sheet)[
    i = .N:1,
    j = sprintf(
      "### %s\n\n%s\n\n%s\n\n%s\n\n::: aside\n%s\n:::\n\n\n\n",
      title, organiser, city, date, add_item_logo(url, colour, type = "spotify")
    )
  ]

  if (page_break_after) {
    c(sprintf("## Oral communications  {data-icon=comment-dots .break-after-me}"), text)
  } else {
    c(sprintf("## Oral communications {data-icon=comment-dots}"), text)
  }
}
