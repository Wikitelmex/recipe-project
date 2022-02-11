class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin'
      can :manage, :all
    else
      can :create, Recipe
      can :manage, Recipe do |recipe|
        recipe.user == user || recipe.public == true || !recipe.user_id?
      end
      cannot :read, Recipe, public: false
      can :read, Food
      can :create, Food
      can :destroy, Food, user: user
    end
  end
end
