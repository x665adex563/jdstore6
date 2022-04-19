class ProductsController < ApplicationController
  def index
    @products = case params[:order]
                when 'by_higher_price'
                  Product.higher_price
                when 'by_lower_price'
                  Product.lower_price
                else
                  Product.recent
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
    else
      flash[:warning] = "你的購物車內已有此物品"
    end
    redirect_to :back
  end

  def kirby
    @products = case params[:order]
                when 'by_higher_price'
                  Product.where(:series => "星之卡比").higher_price
                when 'by_lower_price'
                  Product.where(:series => "星之卡比").lower_price
                else
                  Product.where(:series => "星之卡比").recent
                end
  end

  def monster_hunter
    @products = case params[:order]
                when 'by_higher_price'
                  Product.where(:series => "Monster Hunter").higher_price
                when 'by_lower_price'
                  Product.where(:series => "Monster Hunter").lower_price
                else
                  Product.where(:series => "Monster Hunter").recent
                end
  end

  def super_smash_bros
    @products = case params[:order]
                when 'by_higher_price'
                  Product.where(:series => "任天堂明星大亂鬥").higher_price
                when 'by_lower_price'
                  Product.where(:series => "任天堂明星大亂鬥").lower_price
                else
                  Product.where(:series => "任天堂明星大亂鬥").recent
                end
  end

  def super_mario
    @products = case params[:order]
                when 'by_higher_price'
                  Product.where(:series => "超級瑪利歐").higher_price
                when 'by_lower_price'
                  Product.where(:series => "超級瑪利歐").lower_price
                else
                  Product.where(:series => "超級瑪利歐").recent
                end
  end

  def splatoon
    @products = case params[:order]
                when 'by_higher_price'
                  Product.where(:series => "斯普拉遁").higher_price
                when 'by_lower_price'
                  Product.where(:series => "斯普拉遁").lower_price
                else
                  Product.where(:series => "斯普拉遁").recent
                end
  end

  def zelda_botw
    @products = case params[:order]
                when 'by_higher_price'
                  Product.where(:series => "薩爾達傳說 曠野之息").higher_price
                when 'by_lower_price'
                  Product.where(:series => "薩爾達傳說 曠野之息").lower_price
                else
                  Product.where(:series => "薩爾達傳說 曠野之息").recent
                end
  end

  def animal_crossing
    @products = case params[:order]
                when 'by_higher_price'
                  Product.where(:series => "動物森友會").higher_price
                when 'by_lower_price'
                  Product.where(:series => "動物森友會").lower_price
                else
                  Product.where(:series => "動物森友會").recent
                end
  end



  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :series)
  end
end
