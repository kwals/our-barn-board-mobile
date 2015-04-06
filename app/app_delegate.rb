class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
     @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
      @window.makeKeyAndVisible
      about_tab = UINavigationController.alloc.initWithRootViewController(AboutController.alloc.init)
      task_tab = UINavigationController.alloc.initWithRootViewController(TaskController.alloc.initWithStyle(UITableViewStylePlain))
      task_tab.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemSearch, tag:1)
      @tabbar = UITabBarController.alloc.init 
      @tabbar.viewControllers = [task_tab, about_tab]
      @tabbar.wantsFullScreenLayout = true
      @window.rootViewController = @tabbar 
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
