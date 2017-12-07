class Claim < ApplicationRecord
	self.table_name = 'claim'
	self.primary_key = 'claim_num'
end
