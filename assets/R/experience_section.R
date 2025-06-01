library(data.table)
library(stringi)

experience_section <- function(xlsx = "data/cv.xlsx", sheet = "experience", page_break_after = FALSE) {
  
  # 1. Leemos todo el sheet como data.table
  dt <- data.table::setDT(read_excel_sheet(xlsx, sheet))
  
  # 2. Formateamos `activities` con viñetas tipo "•"
  dt[, activities_bullets := {
    raw <- as.character(activities)
    partes <- unlist(strsplit(raw, "\\.\\s*"))
    partes <- partes[stringi::stri_trim_both(partes) != ""]
    
    # Viñetas con el carácter Unicode • (\u2022)
    viñetas <- paste0("\u2022 ", stringi::stri_trim_both(partes))
    
    # Unimos con doble salto de línea para Markdown
    paste(viñetas, collapse = "\n\n")
  }, by = seq_len(nrow(dt))]
  
  # 3. Creamos el bloque Markdown con sprintf
  text <- dt[
    i = .N:1,
    j = sprintf(
      "### %s\n\n%s\n\n%s\n\n%s - %s\n\n**Activities:**\n\n%s\n\n\n\n",
      position, institute, city, start, end, activities_bullets
    )
  ]
  
  # 4. Encabezado de sección
  encabezado <- if (page_break_after) {
    "## Professional experience {data-icon=laptop .break-after-me}"
  } else {
    "## Professional experience {data-icon=laptop}"
  }
  
  # 5. Devolver sección completa
  c(encabezado, text)
}
