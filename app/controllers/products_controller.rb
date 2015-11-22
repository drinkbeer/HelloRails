class ProductsController < ApplicationController
  def index
    @products = Product.all
    puts @products.count
    # respond_to do |format|
    #   format.html
      # format.json {render json: }
    # end
    
    # Construct JSON file
    @jproducts = Jbuilder.encode do |json|
      json.products @products do |product|
        json.name product.name
        json.price product.price
        json.active product.active
        
        json.reviews product.reviews do |review|
          json.user review.user
          json.rating review.rating
          json.body review.body
        end
      end
    end
    
    parsed = JSON.parse(@jproducts)
    parsed["products"].each do |product|
      p product["name"]
      p product["price"]
      p product["active"]
      
      product["reviews"].each do |review|
        p review["user"]
        p review["rating"]
        p review["body"]
      end
    end
    
    return @jproducts
  end
  
  def display_to_json
    
  end
end
