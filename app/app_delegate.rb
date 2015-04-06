class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
     @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
      @window.rootViewController = TaskController.alloc.initWithStyle(UITableViewStylePlain)
      @window.rootViewController.wantsFullScreenLayout = true
      @window.makeKeyAndVisible
      true


    # rootViewController = UIViewController.alloc.init
    # rootViewController.title = 'FunColor'
    # rootViewController.view.backgroundColor = UIColor.redColor

    # @search_controller = SearchController.alloc.initWithNibName(nil, bundle:nil)
    # @navigation_controller = 
    #     UINavigationController.alloc.initWithRootViewController(@search_controller)

    # @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    # @window.rootViewController = @navigation_controller

    # label = UILabel.new
    # label.text = "GitHub Checker"
    # # label.frame = [[20,100],[280,30]]
    # @window.addSubview(label)

    
    # @window.makeKeyAndVisible

    # Color.find("rate_limit")

    # true
  end
end
