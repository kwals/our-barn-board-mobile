class Task
attr_accessor :id, :horse_id, :horse_name, :description, :kind
  def initialize(task)
    @id = task["id"]
    @horse_id = task['horse_id']
    @horse_name = task['horse_name']
    @description = task['description']
    @kind = task['kind']
  end
end