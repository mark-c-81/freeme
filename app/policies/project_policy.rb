class ProjectPolicy < CustomPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update_positions
    true
  end
end
