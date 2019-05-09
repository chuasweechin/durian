class ShoppingcartsController < ApplicationController

  def index
    @payment_amount = 0

    @shopping_cart_items = session["cart"]

    session["cart"].each do |item|
      @payment_amount += item["price_per_kg"].to_i * item["weight"].to_i
    end
  end

  def checkout
    @shopping_cart_items = session["cart"]
  end

  def confirmation
    @shopping_cart_items = session["cart"]
  end

  def plus_weight
    session["cart"].each do |durian|
      if durian["id"] == post_params["id"]
        durian["weight"] = durian["weight"].to_i + 1
        durian["weight"] = durian['weight'].to_s
        redirect_to shoppingcarts_path
      end
    end
  end

  def minus_weight
    session["cart"].each do |durian|
      if durian["id"] == post_params["id"]
        durian["weight"] = durian["weight"].to_i - 1
        durian["weight"] = durian['weight'].to_s
        redirect_to shoppingcarts_path
      end
    end
  end

  def delete_item
    session["cart"].each do |durian|
      if durian["id"] == post_params["id"]
        session["cart"].delete_if { |hash| hash["id"] == post_params["id"] }
        redirect_to shoppingcarts_path
      end
    end
  end

  def add_item
    if !session["cart"].kind_of?(Array)
    session["cart"] = []
    end

    found = false;

    if session["cart"].length == 0
      session["cart"] << post_params
      found = true
    else
      session["cart"].each do |durian|
        if durian["id"] == post_params["id"]
          durian['weight'] = durian['weight'].to_i + post_params["weight"].to_i
          durian['weight'] = durian['weight'].to_s
          found = true
        end
      end
    end

    if found == false
      session["cart"] << post_params
    end

    redirect_to root_path
  end

private
  def post_params
    params.require(:durian).permit(:id, :name, :price_per_kg, :weight, :image_url)
  end

end