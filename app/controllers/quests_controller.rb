# app/controllers/quests_controller.rb
class QuestsController < ApplicationController
  before_action :set_quest, only: [ :update, :destroy ]
  before_action :load_quests, only: [ :index, :create ]

  def index
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to quests_path }
      end
    else
      render :index
    end
  end

def update
  @quest = Quest.find(params[:id])
   @quest.update(status: params[:status] == "1")

  respond_to do |format|
    format.turbo_stream
    format.html { redirect_to quests_path }
  end
end

  def destroy
    @quest.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path }
    end
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def load_quests
    @quests = Quest.order(created_at: :desc)
  end

  def quest_params
    params.require(:quest).permit(:title, :description, :status)
  end
end
