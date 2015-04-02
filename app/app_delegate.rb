class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'FunColor'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    @search_controller = SearchController.alloc.initWithNibName(nil, bundle:nil)
    @navigation_controller = 
        UINavigationController.alloc.initWithRootViewController(@search_controller)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = @navigation_controller
    @window.makeKeyAndVisible

    Color.find("rate_limit")

    true
  end
end
