class TeamMember < ActiveRecord::Base
        belongs_to :team
        belongs_to :user
        default_scope -> { order('created_at DESC') }
        validates :user_id, presence: true
        validates :team_id, presence: true
end