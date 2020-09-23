class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @tail == nil
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if @tail == nil
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    result = 0
    if @tail == nil
      0
    else
      current_node = @head
      while current_node != @tail
        result += 1
        current_node = current_node.next_node
      end
      result += 1
    end

    result
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current_node = @head
    number = 0
    while number != index
      current_node = current_node.next_node
      number += 1
    end
    current_node
  end

  def pop
    length = size
    @tail = at(length - 2)
    @tail.next_node = nil
  end

  def contains?(value)
    current_node = @head
    result = false
    if @tail.value == value
      result = true
    else
      while current_node != @tail && !result
        if current_node.value == value
          result = true
        else
          current_node = current_node.next_node
        end
      end
    end
    if result
      true
    else
      false
    end
  end

  def find(value)
    if contains?(value)
      index = 0
      current_node = @head
      found = false
      while current_node != @tail && !found
        if current_node.value == value
          found = true
        else
          current_node = current_node.next_node
          index += 1
        end
      end
      if @tail.value == value && !found
        index += 1
      end
      index
    else
      nil
    end
  end

  def to_s
    result = ""
    current_node = @head
    until current_node == @tail
      result += "#{current_node.value} -> "
      current_node = current_node.next_node
    end
    result += "#{@tail.value} -> nil"
    puts result
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

linked_list = LinkedList.new
linked_list.append(0)
linked_list.append(1)
linked_list.append(2)
linked_list.append(3)
linked_list.append(4)
linked_list.prepend(-1)
linked_list.prepend(-2)
linked_list.append(5)
linked_list.to_s
puts linked_list.size
puts linked_list.at(2).value
linked_list.pop
linked_list.to_s
puts linked_list.contains?(2)
puts linked_list.contains?(7)
puts linked_list.find(2)
puts linked_list.find(7)
linked_list.to_s
linked_list.to_s