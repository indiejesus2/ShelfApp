class UserBook < ActiveRecord::Base
    belongs_to :user
    belongs_to :book

    def set_default_status
        self.read = false
        self.pages_read = 0
    end
end