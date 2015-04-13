class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
     @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
      @window.makeKeyAndVisible
      # # about_tab = UINavigationController.alloc.initWithRootViewController(AboutController.alloc.init)
      # task_tab = UINavigationController.alloc.initWithRootViewController(TaskController.alloc.initWithStyle(UITableViewStylePlain))
      # # task_tab.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItem, tag:3)
      # @tabbar = UITabBarController.alloc.init 
      # @tabbar.viewControllers = [task_tab] #, about_tab]
      # @tabbar.wantsFullScreenLayout = true
      @task_controller = UINavigationController.alloc.initWithRootViewController(TaskController.alloc.initWithStyle(UITableViewStylePlain))
      @window.rootViewController = @task_controller
      @login_controller = LoginController.alloc.initWithNibName(nil, bundle:nil)
      @navigation_controller = UINavigationController.alloc.initWithRootViewController(@login_controller)
      # @window.rootViewController = @navigation_controller
      true
  end
end
