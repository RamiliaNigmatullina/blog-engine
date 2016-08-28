class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record.to_model
  end

  def manage?
    @record.user == @user
  end
end

# class ApplicationPolicy
#   attr_reader :user, :record

#   def initialize(record, user = nil)
#     @user = user
#     @record = record.to_model
#   end

#   def manage?
#     @user && @record.user == @user
#   end
# end
