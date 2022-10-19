# ===================2h34min

class Element
  attr_accessor :next
  attr_reader :datum

  def initialize(*data)
    @datum = data.first
    @next = data.last if data.last.is_a?(Element)
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def head
    @list.last
  end

  def push(element)
    @list.push(Element.new(element))
    head.next = @list[-2] if @list.size > 1
  end

  def peek
    @list.empty? ? nil : head.datum
  end

  def pop
    @list.pop.datum
  end

  def to_a
    @list.reverse.map(&:datum)
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def self.from_a(elements)
    list = SimpleLinkedList.new
    elements.reverse.each { |e| list.push(e) } unless
    elements.nil? || elements.empty?
    list
  end
end
