# frozen_string_literal: true

class Tenant < ApplicationRecord
  include TenantCacheConcern

  has_one :domain_config, dependent: :delete
  has_one :subscription, class_name: 'Billing::Subscription', dependent: :delete

  has_many :tags, dependent: :delete_all
  has_many :tickets, dependent: :delete_all

  def to_s
    name
  end
end
