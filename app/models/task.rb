class Task
attr_accessor :horse_id, :horse_name, :description, :kind
  def initialize(task)
    @horse_id = task['horse_id']
    @horse_name = task['horse_name']
    @description = task['desciption']
    @kind = task['kind']
  end
end