ActiveAdmin.register Transaction do
  #
  # Menu
  #
  menu :parent => 'Users'

   #
  # Filters
  #
  filter :user, :as => :select, :collection => User.all.collect { |user| [user.email, user.id] }
  filter :transaction_type
  filter :transaction_date
  filter :post_date
  filter :description
  filter :amount

  actions :all, :except => [:new, :create, :edit, :update, :show]
  index do
    column :id
    column 'User', :user_id do |transaction|
      transaction.user.email
    end

    column :transaction_import_id
    column :transaction_type
    column :transaction_date
    column :post_date
    column :description
    column :amount
    default_actions
  end

  #
  # Form
  #
  form do |f|
    f.inputs do
      f.input :user_id, :as => :select, :collection => User.all.collect { |user| [user.email, user.id] }
      f.input :transaction_type
      f.input :transaction_date, :as => :datetime
      f.input :post_date,        :as => :datetime
      f.input :description
      f.input :amount
    end
    f.buttons
  end

end

