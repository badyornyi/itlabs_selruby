module HelperMethods

  ### Common methods

  ### Navigation methods

  def open_page_main
    @driver.get 'http://demo.redmine.org/'
  end

  def open_page_login
    open_page_main
    @wait.until {@driver.find_element(:class => 'login').displayed?}
    @driver.find_element(:class => 'login').click
  end

  def open_page_registration
    open_page_main
    @wait.until {@driver.find_element(:class => 'register').displayed?}
    @driver.find_element(:class => 'register').click
  end

  def open_page_user_account
    #open_page_main
    @wait.until {@driver.find_element(:class => 'my-account').displayed?}
    @driver.find_element(:class => 'my-account').click
  end

  def open_page_password
    @wait.until {@driver.find_element(:css => '.icon.icon-passwd').displayed?}
    @driver.find_element(:css => '.icon.icon-passwd').click
  end

  def open_page_projects
    @wait.until {@driver.find_element(:class => 'projects').displayed?}
    @driver.find_element(:class => 'projects').click
  end

  def open_page_issues
    @wait.until {@driver.find_element(:css => '.issues').displayed?}
    @driver.find_element(:css => '.issues').click
  end

  def open_tab_proj_members
    @wait.until {@driver.find_element(:id => 'tab-members').displayed?}
    @driver.find_element(:id => 'tab-members').click
  end

  def open_tab_versions
    @wait.until {@driver.find_element(:id => 'tab-versions').displayed?}
    @driver.find_element(:id => 'tab-versions').click
  end


  ### Users methods

  def register_user(login)
    if login
      @login = login
    else
      @login = 'my_test_user_' + rand(9999).to_s
    end
    @password = @login + '_pwd'
    hash = {
        :user_login => @login,
        :user_password => @password,
        :user_password_confirmation => @password,
        :user_firstname => 'first name',
        :user_lastname => 'last name',
        :user_mail => @login + '@mail.test'
    }
    hash.each_pair do |key, value|
      @driver.find_element(:id => key.to_s).send_keys value
    end
    @driver.find_element(:name => 'commit').click
  end

  def log_in(login, password)
    @login = login
    @wait.until {@driver.find_element(:id => 'username').displayed?}
    @driver.find_element(:id => 'username').send_keys @login
    @driver.find_element(:id => 'password').send_keys password
    @driver.find_element(:name => 'login').click
  end

  def password_input
    @wait.until {@driver.find_element(:id => 'password').displayed?}
    @driver.find_element(:id => 'password').send_keys(@password)
  end

  def password_input_new
    @password = @password + '_new'
    @driver.find_element(:id => 'new_password').send_keys(@password)
    @driver.find_element(:id => 'new_password_confirmation').send_keys(@password)
  end

  def password_change_commit
    @driver.find_element(:name => 'commit').click
  end


  ### Projects -> Project methods

  def project_new_project
    @wait.until {@driver.find_element(:css => '.icon.icon-add').displayed?}
    @driver.find_element(:css => '.icon.icon-add').click
  end

  def project_create_name
    @project_name = ('project_' + rand(99999).to_s)
  end

  def project_fill_form
    @wait.until {@driver.find_element(:id => 'project_name').displayed?}
    @driver.find_element(:id => 'project_name').send_keys(@project_name)
    @driver.find_element(:id => 'project_description').send_keys('Description for ' + @project_name)
    @driver.find_element(:id => 'project_identifier').send_keys('uid_' + @project_name)
    @driver.find_element(:id => 'project_homepage').send_keys('http://demo.redmine.org/my/account')
  end

  def project_commit_form
    @driver.find_element(:css => 'input[name=commit]').click
  end

  def project_create_new_project
    project_new_project
    project_create_name
    project_fill_form
    project_commit_form
  end


  ### Projects -> Project Members methods

  def members_add_user_to_proj(user_name)
    #клик на "Новый участник"
    @wait.until {@driver.find_element(:css => '#tab-content-members .icon.icon-add').displayed?}
    @driver.find_element(:css => '#tab-content-members .icon.icon-add').click
    #ввод юзера в сёрч
    @wait.until {@driver.find_element(:id => 'principal_search').displayed?}
    @driver.find_element(:id => 'principal_search').send_keys(user_name)
    #клик на чекбокс по юзеру
    sleep 1
    @wait.until {@driver.find_element(:css => '#principals input').displayed?}
    @driver.find_element(:css => '#principals input').click
  end

  def members_set_user_role(role_name = 'Manager')
    #клик на чекбокс роли
    @role_index = members_resolve_role_index(role_name)
    @wait.until {@driver.find_element(:css => ".roles-selection input[value='#{@role_index}']").displayed?}
    @driver.find_element(:css => ".roles-selection input[value='#{@role_index}']").click
  end

  def members_add_user_submit
    #подтверждение добавления
    @wait.until {@driver.find_element(:id => 'member-add-submit').displayed?}
    @driver.find_element(:id => 'member-add-submit').click
  end

  def member_role_resolve_name(user_name)
    @wait.until {@driver.find_element(:css => '.even.member').displayed?}
    name = ''
    names = @driver.find_elements(:css => '.name.user')
    names_count = @driver.find_elements(:css => '.name.user').count
    name_index = 0
    until ((name == (user_name + ' ' + user_name)) || (name_index >= names_count)) do
      name = names[name_index].text
      name_index+=1
    end
    name_index - 1
  end

  def edit_member_role_click(name_index)
    #клик на "режактировать"
    @wait.until {@driver.find_elements(:css => '.roles span')[name_index].displayed?}
    buttons = @driver.find_elements(:css => '.icon.icon-edit')
    buttons[name_index].click
  end

  def edit_member_role_uncheck(name_index)
    #анчек предыдущей роли
    @wait.until {@driver.find_elements(:css => '.roles form')[name_index].displayed?}
    @driver.find_elements(:css => ".roles input[value='#{@role_index}']")[name_index].click
  end

  def edit_member_role_check(name_index,role_name)
    #чек новой роли
    @role_index = members_resolve_role_index(role_name)
    @driver.find_elements(:css => ".roles input[value='#{@role_index}']")[name_index].click
  end

  def edit_member_role_submit(name_index)
    #сохранение ролей
    @driver.find_elements(:css => '.roles form input[name="commit"]')[name_index].click
  end


  ### Projects -> Project Versions methods

  def version_add_new_click
    @wait.until {@driver.find_element(:css => 'a[href*="versions/new"]').displayed?}
    @driver.find_element(:css => 'a[href*="versions/new"]').click
  end

  def version_add_new_fill_form
    #заполнение формы версии
    version = ('Version' + rand(99999).to_s)
    @wait.until {@driver.find_element(:id => 'version_name').displayed?}
    @driver.find_element(:id => 'version_name').send_keys(version)
    @driver.find_element(:id => 'version_description').send_keys(version + ' Description')
    @driver.find_element(:id => 'version_wiki_page_title').send_keys(version + ' wiki page')
    @driver.find_element(:id => 'version_effective_date').send_keys(Date.today)
  end

  def version_add_new_commit
    @driver.find_element(:name => 'commit').click
  end

  def version_create_new_version
    version_add_new_click
    version_add_new_fill_form
    version_add_new_commit
  end


  ### Issues methods

  def issue_add_new_click
    @wait.until {@driver.find_element(:class => 'new-issue').displayed?}
    @driver.find_element(:class => 'new-issue').click
  end

  def issue_create_issue_fill_form(issue_type)
    @issue_subj = issue_type + ' ' + rand(99999).to_s
    @issue_type = issue_type

    @wait.until {@driver.find_element(:id => 'issue_tracker_id').displayed?}
    @driver.find_element(:id => 'issue_tracker_id').send_keys(@issue_type)
    @driver.find_element(:id => 'issue_subject').send_keys(@issue_subj)
    @driver.find_element(:id => 'issue_description').send_keys('Description')
    @driver.find_element(:id => 'issue_assigned_to_id').send_keys(@login)
    @driver.find_element(:id => 'issue_fixed_version_id').send_keys(@version)
  end

  def issue_create_issue_commit
    @wait.until {@driver.find_element(:css => 'input[name="commit"]').displayed?}
    @driver.find_element(:css => 'input[name="commit"]').click
  end

  def issue_added_resolve_name
    @issue_title = ''
    issues_titles = @driver.find_elements(:css => '.subject a')
    issues_count = @driver.find_elements(:css => '.subject a').count
    @issue_index = 0
    until ((@issue_title == @issue_subj) || (@issue_index >= issues_count)) do
      @issue_title = issues_titles[@issue_index].text
      @issue_index+=1
    end
    @issue_index = @issue_index - 1
  end

  def issue_become_watcher
    @wait.until {@driver.find_element(:css => '.icon.icon-fav-off').displayed?}
    @driver.find_element(:css => '.icon.icon-fav-off').click
  end

  def issue_watched?
    begin
      @driver.find_element(:css => '.icon.icon-fav').displayed?
      return true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      return false
    end
  end


  ### Service methods

  private
  def members_resolve_role_index(role_name)
    role_name.downcase!
    case role_name
      when 'manager'
        3
      when 'developer'
        4
      when 'reporter'
        5
      else
        fail "Unknown user role name: #{}"
    end
  end
end