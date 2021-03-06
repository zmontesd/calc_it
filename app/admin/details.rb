ActiveAdmin.register Detail do

  #
  # Menu
  #
  menu :parent => 'Users'

  #
  # Filters
  #
  filter :user, :as => :select, :collection => User.all.collect { |user| [user.email, user.id] }
  filter :full_name
  filter :gender, :as => :select, :collection => Detail.gender
  filter :date_of_birth
  #
  # Index page
  #
  actions :all, :except => [:new, :create, :edit, :update, :show, :destroy]
  index do
    column :id
    column 'User', :user_id do |detail|
      detail.user.email
    end
    column :full_name
    column :gender
    column :date_of_birth
    default_actions
  end

  #
  # Form
  #
  form do |f|
    f.inputs do
      f.input :user_id, :as => :select, :collection => User.all.collect { |user| [user.email, user.id] }
      f.input :full_name
      f.input :gender, :as => :select, :collection => Detail.gender
      f.input :date_of_birth, :as => :date
    end
    f.buttons
  end


end
