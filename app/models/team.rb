class Team < ActiveRecord::Base

    belongs_to :owner, class_name: "User"

    has_many :members, class_name:"TeamMember", dependent: :destroy
    default_scope -> { order('created_at DESC') }

    validates :owner_id, presence: true
    validates :name, presence: true

    def owned?(other_user)
        owner == other_user
    end

    def joined?(other_user)  
        members.find_by(user_id: other_user.id)
    end

     def join!(other_user)
        members.create!(user_id: other_user.id)
     end

     def quit(other_user)
            members.find_by(user_id: other_user.id).destroy!
     end

end
