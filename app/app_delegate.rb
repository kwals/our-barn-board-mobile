class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
     @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
      @window.makeKeyAndVisible
      @defaults = NSUserDefaults.standardUserDefaults
      @task_controller = UINavigationController.alloc.initWithRootViewController(TaskController.alloc.initWithStyle(UITableViewStylePlain))
      @window.rootViewController = @task_controller
      @login_controller = LoginController.alloc.initWithNibName(nil, bundle:nil)
      @navigation_controller = UINavigationController.alloc.initWithRootViewController(@login_controller)
      # @window.rootViewController = @navigation_controller
      true
  end
end
