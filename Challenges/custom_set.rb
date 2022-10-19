# ---------------- 134 (2h14min)

class CustomSet
  def initialize(*elements)
    @elements = elements.flatten.uniq
    @subsets = generate_subsets
  end

  def empty?
    elements.empty?
  end

  def contains?(element)
    subsets.include?(element)
  end

  def generate_subsets
    @subsets = [[]] + @elements + find_subsets
  end

  def find_subsets
    result = []
    (1..elements.size).each do |n|
      elements.combination(n) { |subset| result << subset }
    end
    result = result.select { |e| e.size > 1 }
  end

  def subset?(other_set)
    # other_set.contains?(elements)
    elements.all? { |e| other_set.contains?(e) }
  end

  def disjoint?(other_set)
    shared = elements.intersection(other_set.elements)
    shared.empty? ? true : false
  end

  def eql?(other_set)
    elements.uniq.sort == other_set.elements.uniq.sort
  end

  def add(element)
    elements << element unless elements.include?(element)
    generate_subsets
    self
  end

  def ==(other_set)
    # elements == other_set.elements
    subset?(other_set) && other_set.subset?(self)
  end

  def intersection(other_set)
    overlap = elements.intersection(other_set.elements)
    CustomSet.new(overlap)
  end

  def difference(other_set)
    diff = elements.difference(other_set.elements)
    CustomSet.new(diff)
  end

  def union(other_set)
    union = elements.union(other_set.elements).sort
    CustomSet.new(union)
  end

  protected

  attr_reader :elements

  private

  attr_reader :subsets
end
