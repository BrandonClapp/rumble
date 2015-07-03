class UserPolicy < ApplicationPolicy

  def update?
    
    Rails.logger.debug @user.class.name
    Rails.logger.debug @record.class.name

    if not @user.nil?
      @user.admin? or @user.community_manager? or @user == @record
    else
      false
    end
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
