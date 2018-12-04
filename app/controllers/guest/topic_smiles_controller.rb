class Guest::TopicSmilesController < ApplicationController
  before_action :find_smile, only: [:destroy]

  def create
    @smile = TopicSmile.new(user_id: params[:user].to_i, topic_id: params[:topic].to_i)
    if @smile.save
      # 遷移先未定
      # redirect_to murmurs_path, success: 'つぶやきました'
      redirect_to :back
    else
      render :new, warning: 'つぶやけませんでした'
    end

  end

  def destroy
    @smile.destroy
    redirect_to :back, success: '削除しました'
  end

  private
  def find_smile
    @smile = TopicSmile.find_by(user_id: params[:user].to_i, topic_id: params[:id].to_i)
  end



end
