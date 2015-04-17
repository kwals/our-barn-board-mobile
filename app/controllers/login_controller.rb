class LoginController < UIViewController
# api links
  def get_auth_token(user_email ="bob@example.com", user_password = "password")
    @defaults = NSUserDefaults.standardUserDefaults
    that = API.new('https://ourbarnboard.herokuapp.com/api')
    that.post("/sessions?user[email]=#{user_email}&user[password]=#{user_password}") do |response|
        hash = response.data
        @defaults["email"] = hash["user_email"]
        @defaults["token"] = hash["authentication_token"]
    end
    return true
  end


  def viewDidLoad
    super
    self.title = "Login to OurBarnBoard"
    self.view.backgroundColor = UIColor.whiteColor

    @email_field = UITextField.alloc.initWithFrame [[50,50], [160,26]]
    @email_field.placeholder = "you@email.com"
    @email_field.textAlignment = UITextAlignmentCenter
    @email_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @email_field.borderStyle = UITextBorderStyleRoundedRect 
    @email_field.center = [
      self.view.frame.size.width / 2,
      self.view.frame.size.height / 2 - 150]
    self.view.addSubview(@email_field)

    @password_field = UITextField.alloc.initWithFrame [[50,25], [160,26]]
    @password_field.placeholder = "********"
    @password_field.secureTextEntry = true
    @password_field.textAlignment = UITextAlignmentCenter
    @password_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @password_field.borderStyle = UITextBorderStyleRoundedRect 
    @password_field.center = [
      self.view.frame.size.width / 2,
      self.view.frame.size.height / 2 - 100]
    self.view.addSubview(@password_field)

    @login = UIButton.buttonWithType(UIButtonTypeSystem)
    @login.setTitle("Login", forState:UIControlStateNormal)
    @login.setTitle("Loading...", forState:UIControlStateDisabled)
    @login.sizeToFit
    @login.center = [
      self.view.frame.size.width / 2,
      @password_field.center.y + 40]
    self.view.addSubview(@login)

    @login.when(UIControlEventTouchUpInside) do 
      @login.enabled = false 
      @email_field.enabled = false
      @password_field.enabled = false 

      user_email = @email_field.text
      user_password = @password_field.text
      self.get_auth_token(user_email, user_password)
      task_controller = TaskController.alloc.init
      self.navigationController.pushViewController(task_controller, animated:true)
     end

  end


end
