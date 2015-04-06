class TaskController < UITableViewController
  def viewDidLoad
    super

    @task1 = Task.new({'horse_id' => 2, 
      'horse_name' => 'Henry',
      'description' => 'One flake of alfalfa hay with two scoops of grain',
      'kind' => 'morning'})
    @task2 = Task.new({'horse_id' => 3,
      'horse_name' => 'Ruby',
      'description' => 'One flake of regular hay, no grain.',
      'kind' => 'morning'})
    @task3 = Task.new({'horse_id' => 6,
      'horse_name' => 'Charlie',
      'description' => 'Put out into field.',
      'kind' => 'morning'})
    @tasks = [@task1,@task2,@task3]
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

    cell
  end
end