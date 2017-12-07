class Policy < ApplicationRecord
	self.table_name = 'policy'
	self.primary_key = 'policy_num'

	def marshalled_attributes
		[ id ]
	end

	def id
	  policy_num.to_s.chop.chop
	end
end
