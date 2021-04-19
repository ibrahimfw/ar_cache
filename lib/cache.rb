# frozen_string_literal: true

class Cache

  KEY_HASH = YAML.load_file(File.join(Rails.root, 'config', 'cache_keys.yml')).symbolize_keys!

  class << self

    def key(key_type, value)
      raise StandardError, 'UnImplementedCacheKey' unless KEY_HASH.key?(key_type)

      "#{KEY_HASH[key_type]}:#{value}"
    end

    def get(key, raw: false)
      log('Get', key)
      $memcached.get(key, raw)
    end

    def set(key, value, expiry = 0, raw: false)
      log('Write', key, :light_cyan)
      $memcached.set(key, value, expiry, raw)
    end

    def delete(key)
      log('Delete', key, :red)
      $memcached.delete(key)
    end

    def fetch(key, expiry = 1.week.to_i, &block)

      cache_data = get(key)
      if cache_data.nil?
        log('Miss', key, :light_yellow)
        value = block.call
        set(key, value, expiry)
      else
        log('Hit', key, :light_green)
        value = cache_data
      end
      value
    end

    private

    def log(action, key, color = :light_magenta)
      Rails.logger.info("#{action.ljust(5).to_s.public_send(color)}:[#{key.to_s.light_blue}]")
    end
  end

end
