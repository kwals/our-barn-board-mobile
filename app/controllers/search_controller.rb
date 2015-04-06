class SearchController < UIViewController
   def open_color(color)
      p "Opening #{color.inspect}"
  end
  
  def viewDidLoad
    super
    self.title = "Find color!"
    self.view.backgroundColor = UIColor.whiteColor

    @text_field = UITextField.alloc.initWithFrame [[0,0], [160,26]]
    @text_field.placeholder = "#abcabc"
    @text_field.textAlignment = UITextAlignmentCenter
    @text_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @text_field.borderStyle = UITextBorderStyleRoundedRect 
    @text_field.center = [
      self.view.frame.size.width / 2,
      self.view.frame.size.height / 2 - 100]
    self.view.addSubview(@text_field)

    @search = UIButton.buttonWithType(UIButtonTypeSystem)
    @search.setTitle("Search!", forState:UIControlStateNormal)
    @search.setTitle("Loading...", forState:UIControlStateDisabled)
    @search.sizeToFit
    @search.center = [
      self.view.frame.size.width / 2,
      @text_field.center.y + 40]
    self.view.addSubview(@search)

    label = UILabel.new
    label.text = "GitHub Checker"
    label.frame = [[20,100],[280,30]]


    @search.when(UIControlEventTouchUpInside) do 
      @search.enabled = false 
      @text_field.enabled = false

      hex = @text_field.text
      hex = hex[1..-1] if hex[0]=="#"

      def display_results(color)
        p "#{color}"
      end

      Color.find(hex) do |color|
        if color.nil?
          @search.setTitle("None, sorry.", forState: UIControlStateNormal)
        else
          @search.setTitle("Seearch", forState: UIControlStateNormal)
          self.display_results(color)
        end
        @search.enabled = true
        @text_field.enabled = true
      end


   
  end
  end
end
