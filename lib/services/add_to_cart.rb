module Store 
  class AddToCart
    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      item = FetchProductFromCart.new.call(@product_id)
      add_item(item)
    end

    private
      def add_item(item)
        if item
          item.quantity += 1
        else
          CART.push(StorageItem.new(@product_id, @quantity))
      end
    end
  end
end