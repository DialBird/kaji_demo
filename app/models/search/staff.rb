# frozen_string_literal: true

class Search::Staff < Search::Base
  ATTRIBUTES = %i[
    gender_ids name email
  ].freeze

  attr_accessor(*ATTRIBUTES)

  def initialize(attributes = {})
    super attributes if attributes.present?
    self.gender_ids ||= []
  end

  def execute
    staffs = base_criteria
    staffs = staffs.gender_is(gender_ids) unless gender_ids.empty?
    staffs = staffs.name_like(name) if name
    staffs = staffs.email_like(email) if email
    staffs
  end

  private

  def base_criteria
    ::Staff.all
  end
end
