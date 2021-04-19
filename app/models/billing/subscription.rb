# frozen_string_literal: true

module Billing
  class Subscription < ApplicationRecord

    belongs_to :tenant

    def to_s
      name
    end
  end
end
