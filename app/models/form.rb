class Form < ActiveRecord::Base
    before_filter ensure_admin!
end
