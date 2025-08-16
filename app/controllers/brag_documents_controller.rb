class BragDocumentsController < ApplicationController
  def show
    @completed_quests = Quest.where(status: true).order(updated_at: :desc)
  end
end
