class DetailController < UIViewController
  attr_accessor :task
    def viewDidLoad
      view.backgroundColor = UIColor.whiteColor
      show_task_detail
    end

    def create_complete
      that = API.new('https://ourbarnboard.herokuapp.com/api')
      that.complete("/routines/#{@task.id}/completes")
          a = UIAlertView.new
          a.title = "Thanks for feeding #{task.horse_name}!"
          a.message = "#{task.horse_name}'s owner has been notified."
          a.show
          a.dismiss
      self.navigationController.popViewControllerAnimated(true)
    end

    def show_task_detail
      label = UILabel.alloc.init
      label.frame = [[50,50], [160,26]]
      label.backgroundColor = UIColor.clearColor
      label.text = @task.horse_name
      label.center = [
      self.view.frame.size.width / 2,
      self.view.frame.size.height / 2 - 200]
      view.addSubview(label)

      label2 = UILabel.alloc.init
      label2.frame = [[50,25], [160,26]]
      label2.backgroundColor = UIColor.clearColor
      label2.text = @task.description
      label2.center = [
      self.view.frame.size.width / 2,
      self.view.frame.size.height / 2 - 100]
      view.addSubview(label2)

      button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      button.sizeToFit
      button.frame = [[50,100],[160,26]]
      button.center = [self.view.frame.size.width / 2,
      self.view.frame.size.height / 2]
      button.setTitle("I fed #{@task.horse_name}", forState:UIControlStateNormal)
      button.setTitle("Done", forState:UIControlStateHighlighted)
      button.setTitle(self, action:'buttonIsPressed', forControlEvents:UIControlEventTouchDown)
      button.addTarget(
        self, action:"create_complete", forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(button)
    end

end