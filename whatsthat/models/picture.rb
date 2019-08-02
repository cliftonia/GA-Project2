# class maps to table
# objects map to records
# following 2 lines is we teach activerecord to do that mapping
# NAMING CONVENTIONS
# singular for model name
# plural for table name 
class Picture < ActiveRecord::Base
  belongs_to :user
end