class ProjectsPage < HomePage

  include PageObject

  page_url DEFAULT_PAGE + '/projects'

  ### Elements

  links(:projects_titles, class: 'project root leaf')


  ### Methods

end