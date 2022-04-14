class ProductsController < ApplicationController
  def index
    @products = Product.recent.all
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
    @products = Product.where(:series => "星之卡比").recent
  end

  def monster_hunter
    @products = Product.where(:series => "Monster Hunter").recent
  end

  def super_smash_bros
    @products = Product.where(:series => "任天堂明星大亂鬥").recent
  end

  def super_mario
    @products = Product.where(:series => "超級瑪利歐").recent
  end

  def splatoon
    @products = Product.where(:series => "斯普拉遁").recent
  end

  def zelda_botw
    @products = Product.where(:series => "薩爾達傳說 曠野之息").recent
  end

  def animal_crossing
    @products = Product.where(:series => "動物森友會").recent
  end



  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :series)
  end
end
