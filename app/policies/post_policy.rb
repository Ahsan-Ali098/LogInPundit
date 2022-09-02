# frozen_string_literal: true

# Post_Policy
#
class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def show?
    # user.present?
    true
  end

  def edit?
    user.present? && user.eql?(post.user)
  end

  def update?
    edit?
  end

  def destroy?
    user.present? && user.eql?(post.user)
  end

  private

  def post
    record
  end
end
