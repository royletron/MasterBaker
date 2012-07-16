class CompetitionsController < ApplicationController
  
  before_filter :authenticate
  before_filter :correct_user
  
  def index
    @competitions = Competition.all
    @title = "Competitions"
  end
  
  def edit
     @competitions = Competition.find(params[:id])
     render :show
  end

  def show
    @competition = Competition.find(params[:id])
  end
  
  def new
    @competition = Competition.new
    @competition.startdate = Date.current
    @competition.enddate = Date.current
  end
  
  def create
    @competition = Competition.create(params[:competition])
    respond_to do |format|  
      if @competition.valid?
        format.html { redirect_to competitions_path}
        format.xml  { head :ok }
      else  
        format.html { render :show }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }             
      end
    end
  end
  
  def update
  end
  
  private

     def authenticate
       deny_access unless signed_in?
     end

     def correct_user
       redirect_to(root_path) unless current_user.god == true
     end
end
