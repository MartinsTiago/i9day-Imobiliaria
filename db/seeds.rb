# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# encoding: UTF-8

require 'csv'

csv_text = File.read('/Users/araujot/Development/i9day/i9day-Imobiliaria/db/PlanilhaDeImoveisFake.csv', encoding: "iso-8859-1:UTF-8")

csv = CSV.parse(csv_text, headers: true, col_sep: ';')

csv.each do |row|
  Property.create(row.to_hash)
end
