class PropertyController < ApplicationController
  def show
    type = params[:type]
    goal = params[:goal]
    respond_to do |format|
      format.html { render Property.where(trasaction_type: type, goal: goal).select(:latitute, :logitude).to_json}
      format.json { render json: Property.where(trasaction_type: type, goal: goal).each{|property| property.weight = metrica(property)}.to_json }
    end
  end

  def index

  end

  def metrica(prop)
    if prop.trasaction_type == 'Aluguel'
      prop.rent_value / prop.area
    else
      prop.sell_value / prop.area
    end
  end
end