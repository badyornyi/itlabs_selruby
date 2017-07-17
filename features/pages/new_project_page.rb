class NewProjectPage < HomePage

  include PageObject

  page_url DEFAULT_PAGE + '/projects/new'

  ### Elements

  text_field(:name, id: 'project_name')
  text_area(:description, id: 'project_description')
  text_field(:identifier, id: 'project_identifier')
  text_field(:homepage, id: 'project_homepage')


  ### Methods

  def create_project(project)
    self.name = project[:name]
    self.description = project[:description]
    self.identifier = project[:identifier]
    self.homepage = project[:homepage]
    submit
  end

end