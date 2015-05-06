Before('@user-index') do
  30.times { FactoryGirl.create(:user) }
end

After('@user-index') do
  User.delete_all
end
