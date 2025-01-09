
certificates_section <- function(xlsx = "data/cv.xlsx", sheet = "certificates", page_break_after = FALSE) {
  
  text <- read_excel_sheet(xlsx, sheet)[
    i = .N:1,
    j = sprintf(
      "### %s\n\n%s\n\n%s\n\n%s - %s\n\nDescription: *%s*\n\n\n\n",
      course, institute, city, start, end, description
    )
  ]
  
  
  if (page_break_after) {
    c("## Certificates {data-icon=certificate .break-after-me}", text)
  } else {
    c("## Certificates {data-icon=certificate}", text)
  }
}
