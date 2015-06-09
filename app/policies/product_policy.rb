class ProductPolicy < ApplicationPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def show?
    true
  end

  def edit?
    (product.user_id == user.try(:id))
  end

  def update?
  	edit?
  end

  def destroy?
    edit?
  end
end
