class TaskController < UITableViewController

  def viewDidLoad
    super
    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStylePlain)
    @myTableView.dataSource = self
    @myTableView.delegate = self

    view.addSubview(@myTableView)
    self.title = "Horses"
  
    @tasks ||= NSMutableArray.new

    this_api = API.new("http://localhost:3000/api")
    this_api.get("/routines") do |response|
      if response.data
        response.data.each do |hash|
          t = Task.new({'id' => hash[:id],
            'horse_id' => hash[:horse_id],
            'horse_name' => hash[:horse_name],
            'description' => hash[:description],
            'kind' => hash[:kind]})
          @tasks.push(t)
        end
        @tasks
      end
      @tasks
      @myTableView.reloadData
    end
  end

  def tableView(tableView, numberOfRowsInSection:section)
    puts @tasks.count
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