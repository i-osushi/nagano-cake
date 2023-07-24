class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_select_genres

    def index
        @item = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.save
          flash[:notice] = "Book was successfully updated."
          redirect_to admin_item_path(@item)
        else
          render 'new'
        end
    end
    def edit
        @item = Item.find(params[:id])

    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
         flash[:notice] = "Book was successfully updated."
         redirect_to admin_items_path(@item)
        else
         render 'new'
        end
    end

    private
    def item_params
        params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
    end

  def set_select_genres
    @genres = Genre.all.map {|genre| [genre.name, genre.id] }.unshift(["--選択してください--", nil])
  end
end
