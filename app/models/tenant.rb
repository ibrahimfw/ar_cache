# frozen_string_literal: true

class Tenant < ApplicationRecord

  has_one :domain_config, dependent: :delete
  has_one :subscription, dependent: :delete

  has_many :tags, dependent: :delete_all
  has_many :tickets, dependent: :delete_all

  def to_s
    name
  end
end
