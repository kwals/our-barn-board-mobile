class LoginController < UIViewController

  def get_auth_token(user_email ="bob@example.com", user_password = "password")
    @defaults = NSUserDefaults.standardUserDefaults
    that = API.new('http://localhost:3000/api/')
    that.post("/sessions", {"user" => {"email" => user_email, "password" => user_password}}) do |response|
        hash = response.data
        puts response.data
        @defaults["email"] = hash["user_email"]
        @defaults["token"] = hash["authentication_token"]

    end
    puts @defaults["email"]
    puts @defaults["token"]
    return true
  end

  def viewDidLoad
    super
    self.title = "Login to OurBarnBoard"
    self.view.backgroundColor = UIColor.whiteColor

    # Turn this in the email login field
    @email_field = UITextField.alloc.initWithFrame [[50,50], [160,26]]
    @email_field.placeholder = "you@email.com"
    @email_field.textAlignment = UITextAlignmentCenter
    @email_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @email_field.borderStyle = UITextBorderStyleRoundedRect 
    @email_field.center = [
      self.view.frame.size.width / 2,
      self.view.frame.size.height / 2 - 150]
    self.view.addSubview(@email_field)

    # So Here I'm going to need another text field for the password
    @password_field = UITextField.alloc.initWithFrame [[50,25], [160,26]]
    @password_field.placeholder = "********"
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

# What to do now? Alert view?
# How to redirect?
       # do |token|
      #   if token
      #     @email_field.setTitle("your emal")
      #     @password_field.setTitle("hunter2")
      #     self.proceed_with_login
      #   else
      #     @email_field.setTitle("Not found", forState: UIControlStateNormal)
      #     @password_field.setTitle("Notfoind", forState: UIControlStateNormal)
      #   end
      #   @email_field = true
      #   @password_field = true
      # end

      # def display_results(color)
      #   p "#{color}"
      # end

      # Color.find(hex) do |color|
      #   if color.nil?
      #     @search.setTitle("None, sorry.", forState: UIControlStateNormal)
      #   else
      #     @search.setTitle("Seearch", forState: UIControlStateNormal)
      #     self.display_results(color)
      #   end
      #   @search.enabled = true
      #   @text_field.enabled = true
      # end
     end

  end



      # button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      # button.sizeToFit
      # button.frame = [[100,200],[250,250]]
      # button.setTitle("Get auth!", forState:UIControlStateNormal)
      # button.setTitle("Done", forState:UIControlStateHighlighted)
      # button.setTitle(self, action:'buttonIsPressed', forControlEvents:UIControlEventTouchDown)
      # button.addTarget(
      #   self, action:"get_auth_token", forControlEvents:UIControlEventTouchUpInside)
      # self.view.addSubview(button)
end
