class CommentsController <  ApplicationController

  def create
    # @comment = Comment.new(comment_params)
    # @comment.item_id = params[:item_id]
    # @comment.user_id = current_user.id

    # @comment = Comment.new(comment_params,
    #                        item_id: params[:item_id],
    #                        user_id: current_user.id)
    @item = Item.find(params[:item_id])

    # @comment = @item.comments.build(comment_params.merge(user: current_user))

    @comment = current_user.comments.build(comment_params.merge(item: @item))
    # @comment.item = @item 可以直接寫在上句的後面

    if @comment.save
      # redirect_to item_path(params[:item_id]), notice: "OK!"
    else
      render 'items/show'
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end

end