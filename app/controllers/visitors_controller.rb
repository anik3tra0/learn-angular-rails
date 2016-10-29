class VisitorsController < ApplicationController
  before_action :set_visitor,  only: [:update, :destroy]
  respond_to :json

  def index
    respond_to do |format|
      format.json { render json: Visitor.all }
      format.html
    end
  end

  def create
    respond_with Visitor.create(visitor_params)
  end

  def update
    respond_with @visitor.update(visitor_params)
  end

  def destroy
    respond_with @visitor.destroy(params[:id])
  end

private

  def visitor_params
    params.require(:visitor).permit(:first_name, :last_name, :reason)
  end

  def set_visitor
    @visitor = Visitor.find(params[:id])
  end

end