class LikesController < ApplicationController
  layout false

  def index
    post = Product.find( params[:product_id] )
    render :json=> { success: true, count: post.liked_count }
  end

  def create
    post = Product.find( params[:product_id] )
    like = post.likes.build

    if like.save
      render :json=> { success: true, id: like.id.to_s, count: post.liked_count }
    else
      render :json=> { success: false, count: post.liked_count }
    end
  end

  def destroy
    post = Product.find( params[:product_id] )
    like = post.likes.find(params[:id])
    if like.destroy
      render :json=> { success: true, count: post.reload.liked_count }
    else
      render :json=> { success: false, count: post.reload.liked_count }
    end
  end
end
