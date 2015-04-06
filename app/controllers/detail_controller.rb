class DetailController < UIViewController
  attr_accessor :task
    def viewDidLoad
      view.backgroundColor = UIColor.whiteColor
      show_task_detail
    end

    def show_task_detail
      label = UILabel.alloc.init
      label.frame = [[200, 45], [300, 60]]
      label.backgroundColor = UIColor.clearColor
      label.text = @task.horse_name
      view.addSubview(label)

      image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString("http://www.tbheritage.com/Portraits/Mowf/MowWarAdmiral.jpg")))
      view.addSubview(UIImageView.alloc.initWithImage(image))

      label2 = UILabel.alloc.init
      label2.frame = [[20, 100], [300,30]]
      label2.backgroundColor = UIColor.clearColor
      label2.text = @task.description
      view.addSubview(label2)

      button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      button.sizeToFit
      button.frame = [[150,150],[300,300]]
      button.setTitle("I have fed #{@task.horse_name}", forState:UIControlStateNormal)
      button.setTitle("Done", forState:UIControlStateHighlighted)
      button.setTitle(self, action:'buttonIsPressed', forControlEvents:UIControlEventTouchDown)
      button.addTarget(
        self, action:"create_complete", forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(button)
      # I will probably also need to add if/else logic so that the button is ONLY shown if the horse has not been fed.
      # Here I need to put a button on the screen that will send a post request to the proper route
      # I will also need to make sure that the @task knows about it's routine id - that will be vital for getting the route correct
      # THen I will probably add a function that allows me to make an outgoing call to the right place to create a complete
    
    end


    def create_complete
      puts "And then you would create a complete, of course!"
    end
end