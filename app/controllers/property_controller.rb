class PropertyController < ApplicationController
  def show
    type = params[:type]
    goal = params[:goal]
    Property.where(trasaction_type: type, goal: goal).select(:latitude, :longitude).to_json
  end

  def index

  end
end