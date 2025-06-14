contact_section <- function(xlsx = "data/cv.xlsx", sheet = "contact", colour = "#333333") {
  read_excel_sheet(xlsx, sheet)[
    j = sprintf(
      fmt = paste(
        "## Contact Info {#contact}\n",
        "- %s %s",
        "- %s %s",
        "- %s %s",
        "- %s [%s](mailto:%s)",
        "- %s %s", # phone,
        "- %s [%s](%s)",
        #"- %s [%s](https://orcid.org/%s)",
        "- %s [%s](https://www.linkedin.com/in/%s)",
        "- %s [%s](https://github.com/%s)",
        #"- %s [%s](https://twitter.com/%s)",
        #"- %s [%s](%s)", #researchgate
        "\n",
        sep = "\n"
      ),
      fontawesome::fa("user", fill = colour), position,
      fontawesome::fa("building-columns", fill = colour), institute,
      fontawesome::fa("map-location-dot", fill = colour), city,
      fontawesome::fa("envelope", fill = colour), gsub("\\.", "\\.", sub("@", "@", email)), email,
      fontawesome::fa("phone", fill = colour), phone,
      fontawesome::fa("house", fill = colour), sub("/$", "", sub("https*://", "", website)), website,
      #fontawesome::fa("orcid", fill = colour), orcid, orcid,
      fontawesome::fa("linkedin", fill = colour), linkedin, linkedin,
      fontawesome::fa("github", fill = colour), github, github
      #fontawesome::fa("x-twitter", fill = colour), twitter, twitter,
      #fontawesome::fa("researchgate", fill = colour), researchgate, researchgate
    )
  ]
}
