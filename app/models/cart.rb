class Cart
  def initialize(items = [])
    @items = items
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
    result = @items.sum { |item| item.total }
    #4/1全館打1折
    if Time.now.month ==  4 and Time.now.day == 1
      result  = result * 0.1 
    end

    return result

    #@item.reduce(0) { |sum, item| sum + item.total }
    #@item.sum { |item| item.total }

    #tmp  =  0
    #@items.each do |item|
    #  tmp += item.total 
    #end
    #return tmp
  end

  def self.form_hash(hash = nil)
    if hash && hash["items"] 
      #items = []

      #hash["items"].each do |item|
      #  items << CartItem.new(item["item_id"], item["quantity"])
      #end

      items = hash["items"].map { |item|
        CartItem.new(item["item_id"], item["quantity"])
      } 

      #Cart.new(items) 在類別裡可直接呼叫他自己的方法 小括號也省略
      new items
    else
      #Cart.new 在類別裡可直接呼叫他自己的方法
      new
    end
  end

  def to_hash
    #items = []

    #@items.each do |item|
    #  items << { "item_id" => item.item_id, 
    #             "quantity" => item.quantity }
    #end
    items = @items.map { |item|
      { "item_id" =>  item.item_id, "quantity" => item.quantity }
  }
    return {
      "items" => items
    }
  end
end