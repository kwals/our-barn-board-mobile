class DetailController < UIViewController
  attr_accessor :task
    def viewDidLoad
      view.backgroundColor = UIColor.whiteColor
      show_task_detail
    end

    def show_task_detail
      label = UILabel.alloc.init
      label.frame = [[120, 20], [300, 30]]
      label.backgroundColor = UIColor.clearColor
      label.text = @task.horse_name
      view.addSubview(label)

      image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString("https://thevaulthorseracing.files.wordpress.com/2012/01/cc_war-admiral_belmont-1937.jpg")))

      label2 = UILabel.alloc.init
      label2.frame = [[20, 100], [300,30]]
      label2.backgroundColor = UIColor.clearColor
      label2.text = @task.description
      view.addSubview(label2)
    end
end