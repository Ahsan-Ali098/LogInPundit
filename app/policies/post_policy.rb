# frozen_string_literal: true

# app/policies/post_policy.rb

class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def show?
    user.present?
  end

  def update?
    return true if user.present? && user == post.user
  end

  def destroy?
    return true if user.present? && user == post.user
  end

  private

  def post
    record
  end
end
