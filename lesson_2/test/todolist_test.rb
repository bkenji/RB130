require "simplecov"
SimpleCov.start 

require "minitest/autorun"


require_relative "../todo.rb"

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todos.first, @list.first)
  end
  
  def test_last
    assert_equal(@todos.last, @list.last)
  end

  def test_shift
    assert_equal(@todos.shift, @list.shift)
    assert_equal(@todos, @list.to_a)
  end

  def test_pop
    assert_equal(@todos.pop, @list.pop)
    assert_equal(@todos, @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_that_added_item_is_a_Todo_object
    assert_raises(TypeError) { @list.add(3) }
  end

  def test_shovel
    new_todo = Todo.new("Drink water")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Drink water")
    list_dup = @list.dup
    @list << new_todo
    list_dup.add(new_todo)
    
    assert_equal(@list.to_a, list_dup.to_a)
  end

  def test_item_at
    assert_equal(@todos.fetch(1), @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(10) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    @todo2.done!
    assert_equal(true, @todo2.done?)
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
  end

  def test_done!
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100)}
    assert_equal(@todos.delete_at(1), @list.remove_at(1))
    assert_equal(2, @list.to_a.size)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    str = <<~TEXT.strip
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    TEXT
    assert_equal(str, @list.to_s)
  end

  def test_to_s_done
    str = <<~TEXT.strip
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    TEXT
     
    @list.mark_done_at(1)
    assert_equal(str, @list.to_s) 
  end

  def test_to_s_all_done
    str = <<~TEXT.strip
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    TEXT

    @list.done!
    assert_equal(str, @list.to_s)
  end

  def test_each
    result = []
    @list.each {|todo| result << todo}
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_return_value
    assert_equal(@list, @list.each(&:object_id))
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)


    assert_equal(list.to_s, @list.select(&:done?).to_s)
  end


end
