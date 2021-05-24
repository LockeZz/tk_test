class Maillist < ApplicationRecord
    serialize :mails, Array
end
