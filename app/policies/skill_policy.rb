class SkillPolicy < CustomPolicy
  class Scope < Scope
    def resolve
      scope.all

      # scope.where(user: user)
    end
  end

  def update_positions
    true
  end
end
