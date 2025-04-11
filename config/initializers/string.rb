class String
  def to_boolean
    ActiveModel::Type::Boolean.new.cast(self)
  end
end
