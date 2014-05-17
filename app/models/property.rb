class Property < ActiveRecord::Base
  def weight=(weight)
    @weight = weight
  end

  def weight
    @weight
  end

  def as_json(options)
    { lat: self.latitute, longi: self.logitude, weight: self.weight }
  end
end
