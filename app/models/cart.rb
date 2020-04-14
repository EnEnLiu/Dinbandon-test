class Cart
  def initialize
    @items = []
  end
  def add_item(item_id)
    #檢查
    found_item = @items.find { |item| item.item_id == item_id}

    if found_item
      found_item.increment!
    else
      @items << CartItem.new(item_id)
    end
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end

  def total
    #@item.reduce(0) { |sum, item| sum + item.total }

    tmp  =  0
    @items.each do |item|
      tmp += item.total 
    end
    return tmp
  end
end