# frozen_string_literal: true

config = YAML.load_file(File.join(Rails.root, 'config', 'dalli.yml'))[Rails.env].symbolize_keys!
options = { namespace: config[:namespace], compress: true, socket_max_failures: config[:socket_max_failures],
            down_retry_delay: config[:down_retry_delay] }

servers = config.delete(:servers)
$memcached = Dalli::Client.new(servers, options)
