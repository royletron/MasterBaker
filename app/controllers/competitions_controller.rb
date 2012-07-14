class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
    @title = "Competitions"
  end
end
