# Show a list of todo items (initially empty)
# Ask the user to choose an option
# Add a task
# Toggle a task between complete and incomplete
# Delete a task
# Exit the program
# The program will keep asking the user to choose an option until they choose to exit the program.
class Todo_list
  def initialize
    @tasks = []
  end

  pp "TODO List:"
  pp "Options:"
  options = {"A" => "Add a new task", "B" => "Toggle a class completion", "C" => "Delete a task", "D" => "Exit"}
  pp options

  pp "Enter your choice:"

  index = 0
  user_input = gets.chomp.upcase
  puts user_input
  while index < options.length
    if user_input == "A"
      print "Enter task name:"
      task = gets.chomp
      @task << task.new
    elsif user_input == "B"
      print "Enter task number to toggle completion"
      task_number = gets.chomp
      def check_off_task(todo_list, task_number)
        index = task_number - 1
        if index >= 0 && index < todo_list.length
          todo_list[index] = true
          puts "Task ##{task_number} marked as done: '#{todo_list[index]}'"
        else
          puts "Invalid task number."
        end
      end
    elsif user_input == "C"
      task.delete
    elsif user_input == "D"
      print "goodbye"
      break
    else
      print "invalid option"
      break
    end
    index = index + 1
  end
end