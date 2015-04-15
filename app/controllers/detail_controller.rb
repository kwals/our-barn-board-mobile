class DetailController < UIViewController
  attr_accessor :task
    def viewDidLoad
      view.backgroundColor = UIColor.whiteColor
      show_task_detail
    end

    def create_complete
      that = API.new('http://localhost:3000/api')
      that.complete("/routines/#{@task.id}/completes")
    end

    def show_task_detail
      label = UILabel.alloc.init
      label.frame = [[50, 50], [160, 50]]
      label.backgroundColor = UIColor.clearColor
      label.text = @task.horse_name
      label.center = [
      self.view.frame.size.width / 2,
      self.view.frame.size.height / 2 - 250]
      view.addSubview(label)

      # image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString("http://www.tbheritage.com/Portraits/Mowf/MowWarAdmiral.jpg")))
      # view.addSubview(UIImageView.alloc.initWithImage(image))

      label2 = UILabel.alloc.init
      label2.frame = [[5, 25], [200, 200]]
      label2.backgroundColor = UIColor.clearColor
      label2.text = @task.description
      label2.center = [
      self.view.frame.size.width / 2,
      self.view.frame.size.height / 2 - 200]
      view.addSubview(label2)

      button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      button.sizeToFit
      button.frame = [[100,100],[250,250]]
      button.setTitle("I have fed #{@task.horse_name}", forState:UIControlStateNormal)
      button.setTitle("Done", forState:UIControlStateHighlighted)
      button.setTitle(self, action:'buttonIsPressed', forControlEvents:UIControlEventTouchDown)
      button.addTarget(
        self, action:"create_complete", forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(button)

# Add button here to call owner in case of a problem
    end

end