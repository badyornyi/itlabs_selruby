class ProjectSettingsPage < HomePage

  include PageObject

  ### Elements
  
  ## tabs
  link(:information_tab, id: 'tab-info')
  link(:members_tab, id: 'tab-members')
  link(:versions_tab, id: 'tab-versions')
  link(:new_issue, class: 'new-issue')
  link(:issues_tab, class: 'issues')

  ## Members tab
  cells(:members_names, class: 'name user')
  links(:members_edit_buttons, class: 'icon icon-edit')

  # "New member" pop-up
  text_field(:search_user, id: 'principal_search')
  checkboxes(:potential_users, name: 'membership[user_ids][]')
  checkbox(:found_user, name: 'membership[user_ids][]')
  checkbox(:manager_role, xpath: "//*[@class='roles-selection']//label//input[@value='3']")
  checkbox(:developer_role, xpath: "//*[@class='roles-selection']//label//input[@value='4']")
  checkbox(:reporter_role, xpath: "//*[@class='roles-selection']//label//input[@value='5']")
  button(:submit_member, id: 'member-add-submit')

  ## Versions tab
  link(:new_version, xpath: "//*[@id='tab-content-versions']//p//a[@class='icon icon-add']")
  text_field(:version_name, id: 'version_name')
  text_field(:version_description, id: 'version_description')
  text_field(:version_wiki_page, id: 'version_wiki_page_title')
  text_field(:version_date, id: 'version_effective_date')

  ## New Issue tab
  select_list(:issue_type, id: 'issue_tracker_id')
  text_field(:issue_subject, id: 'issue_subject')
  text_area(:issue_description, id: 'issue_description')
  select_list(:issue_status, id: 'issue_status_id')

  ## Issues tab
  cells(:issue_subjects, class: 'subject')
  link(:start_watch, class: 'icon icon-fav-off')
  link(:stop_watch, class: 'icon icon-fav')


  ### Methods

  def add_member_to_project(user, role = 'Manager')
    add_new_item
    self.search_user = user
    wait_until { potential_users_elements.count == 1 }
    check_found_user
    wait_until { found_user_checked? }
    select_role(role)
    submit_member
    wait_until { members_names_elements.map(&:text).include? (user + ' ' + user) }
  end

  def add_project_version(project_name)
    version = project_name + '_version_' + (Date.today).to_s
    #add_new_item
    new_version
    self.version_name = version
    self.version_description = version + ' description'
    self.version_wiki_page = version + ' Wiki'
    self.version_date = Date.today
    submit
  end

  def add_new_issue(issue_type)
    issue_subj = issue_type + ' ' + DateTime.now.strftime('%s')
    self.new_issue
    self.issue_type = issue_type
    self.issue_subject = issue_subj
    self.issue_description = issue_subj + ' description'
    self.issue_status = 'New'
    submit
    issue_subj
  end

  def issue_watched?
    self.wait_until {stop_watch?}
    stop_watch?
  end


  private

  def select_role(role_name)
    role_name.downcase!
    send("check_#{role_name}_role")
  end

end