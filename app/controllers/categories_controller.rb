class CategoriesController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13) #レディース
    @tops = Category.where(ancestry: "1/2")
    @jakets = Category.where(ancestry: "1/21")
    @pants = Category.where(ancestry: "1/43")
    @skirts = Category.where(ancestry: "1/56")
    @onepieces = Category.where(ancestry: "1/62")
    @shoes = Category.where(ancestry: "1/67")
    @roomwers = Category.where(ancestry: "1/78")
    @regwers = Category.where(ancestry: "1/81")
    @list1s = Category.where(ancestry: "1/87")
    @list2s = Category.where(ancestry: "1/95")
    @list3s = Category.where(ancestry: "1/114")
    @list4s = Category.where(ancestry: "1/126")
    @list5s = Category.where(ancestry: "1/131")
    @list6s = Category.where(ancestry: "1/155")
    @list7s = Category.where(ancestry: "1/162")
    @list8s = Category.where(ancestry: "1/169")
    @list9s = Category.where(ancestry: "1/178")
    @list10s = Category.where(ancestry: "1/186")
    @list11s = Category.where(ancestry: "1/196")
    @list12s = Category.where(ancestry: "200/201")  #メンズ
    @list13s = Category.where(ancestry: "200/214")
    @list14s = Category.where(ancestry: "200/238")
    @list15s = Category.where(ancestry: "200/248")
    @list16s = Category.where(ancestry: "200/257")
    @list17s = Category.where(ancestry: "200/270")
    @list18s = Category.where(ancestry: "200/276")
    @list19s = Category.where(ancestry: "200/284")
    @list20s = Category.where(ancestry: "200/293")
    @list21s = Category.where(ancestry: "200/323")
    @list22s = Category.where(ancestry: "200/330")
    @list23s = Category.where(ancestry: "200/335")
    @list24s = Category.where(ancestry: "200/340")
    @list25s = Category.where(ancestry: "200/344")
  end

  def new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
   #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
       @category_parent_array << parent.name
    end
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

