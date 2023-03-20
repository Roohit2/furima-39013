module ActiveHashAssociations
 extend ActiveSupport::Concern

 included do
   extend ActiveHash::Associations::ActiveRecordExtensions
 end
end