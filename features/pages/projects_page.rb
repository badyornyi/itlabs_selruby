class ProjectsPage < HomePage

  include PageObject

  page_url DEFAULT_PAGE + '/projects'

  ### Elements

  link(:new_project, class: 'icon icon-add')
  links(:projects_titles, class: 'project root leaf')


  ### Methods

end