soft_skills_section <- function(xlsx = "data/cv.xlsx", sheet = "soft") {
  text <- read_excel_sheet(xlsx, sheet)[
    j = sprintf(
      '- <span style="color: var(--main-color);">%s</span>',
      what
    )
  ]
  
  sprintf("## Soft Skills {#skills}\n\n%s\n\n", paste(text, collapse = "\n"))
}

