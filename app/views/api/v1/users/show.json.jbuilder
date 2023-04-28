json.extract! @user, :id, :first_name, :last_name, :email, :headline, :about, :available
json.skills @user.skills do |skill|
  json.extract! skill, :id, :skill_name, :level, :years_of_experience, :position
end

json.projects @user.projects do |project|
  json.extract! project, :id, :title, :description
end

json.experiences @user.experiences do |experience|
  json.extract! experience, :id, :experience_name, :company, :role, :start_date, :end_date, :location, :website_url, :summary
end
