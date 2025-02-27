add_item_logo <- function(url, type, colour = "#333333") {
  
  if(type == "github") {
    string <- sub(
      "[GitHub]", # pattern
      paste0("[", fontawesome::fa("github", fill = colour), " GitHub repository]"), # replacement
      sub(
        pattern = "(.*)https://github.com/(.*)",
        replacement = "\\1[GitHub](https://github.com/\\2)",
        x = url
      ),
      fixed = TRUE
    )
  }
  
  if(type == "presentation") {
    string <- sub(
      "[Presentation]", # pattern
      paste0("[", fontawesome::fa("file-powerpoint", fill = colour), " Slides]"), # replacement
      sub(
        pattern = "(.*)https://blenback.github.io/presentations/(.*)",
        replacement = "\\1[Presentation](https://blenback.github.io/presentations/\\2)",
        x = url
      ),
      fixed = TRUE
    )
  }
  
  if(type == "spotify") {
    # Crear el enlace Markdown directamente con el logo y "Podcast"
    string <- paste0("[", fontawesome::fa("spotify", fill = colour), " Podcast](", url, ")")
  }
  
  if(type == "website") {
    string <- sub(
      "[Website]", # pattern
      paste0("[", fontawesome::fa("globe", fill = colour), " Website]"),
      sub(
        pattern = "(.*)", # Captura cualquier texto antes del URL
        replacement = "\\1[Website](", # Reemplaza con el texto seguido de [Website](
        x = url
      ),
      fixed = TRUE
    )
    string <- paste0(string, url, ")") # Añade el URL y el cierre del enlace
  }
  
  return(string)
}