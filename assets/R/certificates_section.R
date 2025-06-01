certificates_section <- function(xlsx = "data/cv.xlsx", sheet = "certificates", page_break_after = FALSE) {
  
  # 1. Leemos el sheet y formateamos cada fila (curso, institución, N/A + fecha)
  entradas <- read_excel_sheet(xlsx, sheet)[
    i = .N:1,
    j = sprintf(
      "### %s\n\n%s\n\nN/A\n\n<p class=\"date\">%s</p>\n\n",
      course,    # nombre del curso
      institute, # institución
      year       # año (con <p class="date"> para que salga con ícono de fecha)
    )
  ]
  
  # 2. Definimos el encabezado con o sin salto de página
  if (page_break_after) {
    encabezado <- "## Certificates {data-icon=certificate .break-after-me}"
  } else {
    encabezado <- "## Certificates {data-icon=certificate}"
  }
  
  # 3. Envolvemos todo en <div class="two-cols"> ... </div>
  contenido <- c(
    encabezado,
    "<div class=\"two-cols\">",
    entradas,
    "</div>"
  )
  
  return(contenido)
}
