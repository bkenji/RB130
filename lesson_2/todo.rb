class Todo
  DONE_MARKER = "X"
  UNDONE_MARKER = " "

  attr_accessor :title, :description, :done

  def initialize(title, description = "")
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class == Todo
      todos << todo
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.dup
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    todos.fetch(index).done!
  end

  def mark_undone_at(index)
    todos.fetch(index).undone!
  end

  def done!
    todos.all?(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    index > (todos.size - 1) ? (raise IndexError) : todos.delete_at(index)
  end

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end

  def each
    counter = 0
    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def find_by_title(title)
    select do |todo|
      todo.title == title
    end.first
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(title)
    each do |todo|
      todo.done! if todo.title == title
    end
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"
# list.mark_done_at(1)
# puts list

# p list.all_done
# list.mark_done("Buy milk")
# p list.all_done
# list.mark_all_done
# p list.all_done
# list.mark_all_undone
# p list.all_done

# <<
# same behavior as add

# todo1.done!

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

# ---- Interrogating the list -----

# # # size
# p list.size                       # returns 3

# # # first
# p list.first                      # returns todo1, which is the first item in the list

# # # last
# p list.last                       # returns todo3, which is the last item in the list

# # #to_a
# p list.to_a                      # returns an array of all items in the list

# # #done?
# p list.done?                     # returns true if all todos in the list are done, otherwise false

# # # ---- Retrieving an item in the list ----

# # # item_at
# # list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# # # ---- Marking items in the list -----

# # # mark_done_at
# # list.mark_done_at               # raises ArgumentError
# p list.mark_done_at(1)            # marks the 2nd item as done
# # list.mark_done_at(100)          # raises IndexError

# # # mark_undone_at
# # list.mark_undone_at             # raises ArgumentError
# p list.mark_undone_at(1)          # marks the 2nd item as not done,
# # list.mark_undone_at(100)        # raises IndexError

# # # done!
# # p list.done!                      # marks all items as done

# # # ---- Deleting from the list -----

# # # shift
# # p list.shift                      # removes and returns the first item in list

# # # pop
# # p list.pop                        # removes and returns the last item in list

# # # remove_at
# # list.remove_at                  # raises ArgumentError
# # list.remove_at(1)               # removes and returns the 2nd item
# # list.remove_at(100)             # raises IndexError

# # # ---- Outputting the list -----

# # # to_s
# puts list               # returns string representation of the list

# # # ---- Today's Todos ----
# # # [ ] Buy milk
# # # [ ] Clean room
# # # [ ] Go to gym

# # # or, if any todos are done

# # # ---- Today's Todos ----
# # # [ ] Buy milk
# # # [X] Clean room
# # # [ ] Go to gym
