class CategoriesController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13)
    @tops = Category.where(ancestry: "1/2")
    @jakets = Category.where(ancestry: "1/21")
    @pants = Category.where(ancestry: "1/43")
    @skirts = Category.where(ancestry: "1/56")
    @onepieces = Category.where(ancestry: "1/62")
  end

 # 以下全て、formatはjsonのみ
 # 親カテゴリーが選択された後に動くアクション
 def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
 end

 # 子カテゴリーが選択された後に動くアクション
 def get_category_grandchildren
   #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
 end
end

