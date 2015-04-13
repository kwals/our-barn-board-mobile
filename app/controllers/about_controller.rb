class AboutController < UIViewController
  def init
    if super
      self.tabBarItem.title = "About"
      self.tabBarItem.image = UIImage.imageNamed('SecondTab.png')
    end
    super
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text = "Our Barn Board"
    @label.lineBreakMode = UILineBreakModeWordWrap;
    @label.numberOfLines = 0
    @label.frame = [[100,50],[250,50]]
    view.addSubview(@label)
  end
end
