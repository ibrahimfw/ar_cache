if Tenant.count.zero?
  tenant = Tenant.create(name: 'Tenant 1')
  puts "Created tenant: #{tenant}"
else
  tenant = Tenant.first
  puts "Loaded tenant: #{tenant}"
end

if tenant.domain_config
  puts "DomainConfig [#{tenant.domain_config}] exists for tenant"
else
  config = DomainConfig.create(domain: 'fw.freshservice.com', tenant: tenant)
  puts "Created domain config: [#{config}] for tenant: #{tenant}"
end

if tenant.subscription
  puts "Subscription [#{tenant.subscription}] exists for tenant"
else
  subscription = Subscription.create(name: 'Enterprise', tenant: tenant)
  puts "Created subscription: [#{subscription}] for tenant: #{tenant}"
end

if tenant.tags.count.zero?
  100.times do
    Tag.create(name: Faker::Lorem.word, tenant: tenant)
  end
  puts "Created tags for tenant: #{tenant}"
end

if tenant.tickets.count.zero?
  1000.times do
    Ticket.create(subject: Faker::Lorem.sentence, tenant: tenant)
  end
  puts "Created tickets for tenant: #{tenant}"
end
