sidebar <- function(
  contact = contact_section(),
  skills = skills_section(),
  languages = languages_section(),
  disclaimer = disclaimer_section()
) {
  cat(
    "# Aside\n",
    contact,
    skills,
    languages,
    disclaimer,
    sep = "\n"
  )
}
