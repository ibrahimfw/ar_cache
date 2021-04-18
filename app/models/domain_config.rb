# frozen_string_literal: true

class DomainConfig < ApplicationRecord

  belongs_to :tenant

  def to_s
    domain
  end
end
