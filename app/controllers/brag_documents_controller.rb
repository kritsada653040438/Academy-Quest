class BragDocumentsController < ApplicationController
  def show
    @completed_quests = Quest.where(status: true).order(updated_at: :desc)
    @uncompleted_quests = Quest.where(status: false).order(updated_at: :desc)
  end
end
