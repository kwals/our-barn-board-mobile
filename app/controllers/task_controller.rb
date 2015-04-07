class TaskController < UITableViewController

  def viewDidLoad
    super

    @task1 = Task.new({'id' => 3,
      'horse_id' => 2, 
      'horse_name' => 'Henry',
      'description' => 'One flake of alfalfa hay with two scoops of grain',
      'kind' => 'morning'})
    @task2 = Task.new({'id' => 2,
      'horse_id' => 3,
      'horse_name' => 'Ruby',
      'description' => 'One flake of regular hay, no grain.',
      'kind' => 'morning'})
    @task3 = Task.new({'id' => 1,
      'horse_id' => 6,
      'horse_name' => 'Charlie',
      'description' => 'Put out into field.',
      'kind' => 'morning'})
    @tasks = [@task1,@task2,@task3]
  
    # @tasks = NSMutableArray.new
    # # @tasks = []
    #  ^should i add ||= to these? is that why the name disappear? 
    # this_api = API.new("http://localhost:3000/")
    # this_api.get do |response|
    #   response.data.each do |hash|

    #     # For reasons I have yet to understand
    #     # It will not pass the hash to initialize, I have to do it here
    #     # Working on figuring out why.
      #   #Also, this does not work consistently. 

    #     t = Task.new({'horse_id' => hash['horse_id'], 
    #    'horse_name' => hash['horse_name'],
    #    'description' => hash['description'],
    #    'kind' => hash['morning']})
    #     puts t.horse_name
    #     @tasks.push(t)
    #   end
    #   puts @tasks
    #   @tasks
    # end


    # @tasks = NSMutableArray.alloc.initWithContentsOfURL("http://localhost:3000/test")
    # ^this doesn't work because the string is not an instance of NSURL

    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStylePlain)
    @myTableView.dataSource = self
    @myTableView.delegate = self

    view.addSubview(@myTableView)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @tasks.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)

  
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifer) || begin 
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifer)
    end
    cell.textLabel.text = @tasks[indexPath.row].horse_name
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    detail_controller = DetailController.alloc.init
    detail_controller.task = @tasks[indexPath.row]
    self.navigationController.pushViewController(detail_controller, animated:true)
  end

end