# frozen_string_literal: true

module TenantCacheConcern
  extend ActiveSupport::Concern

  included do
    after_commit :clear_domain_config_cache, on: %i[update destroy]
  end

  def domain_config_from_cache
    Cache.fetch(domain_config_key) do
      DomainConfig.find_by(tenant_id: id)
    end
  end

  def clear_domain_config_cache
    Cache.delete(domain_config_key)
  end

  private

  def domain_config_key
    Cache.key(:domain_config, id)
  end
end
