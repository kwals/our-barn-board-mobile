class LoginController < UIViewController

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

      # SO here I need add the logic to send the login information to the rails API
      # Get credentials and store them....somewhere
      # 

      # hex = @text_field.text
      # hex = hex[1..-1] if hex[0]=="#"

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
  
end
