module SmartProxyAuth
  extend ActiveSupport::Concern
  included do
    def auth_smart_proxy(proxies = SmartProxy.all, require_cert = true)
      request_hosts = nil
      if request.ssl?
        dn = request.env[Setting[:ssl_client_dn_env]]
        if dn && dn =~ /CN=([^\s\/,]+)/i
          verify = request.env[Setting[:ssl_client_verify_env]]
          if verify == 'SUCCESS'
            request_hosts = [$1]
          else
            logger.warn "SSL cert has not been verified (#{verify}) - request from #{request.ip}, #{dn}"
          end
        elsif require_cert
          logger.warn "No SSL cert with CN supplied - request from #{request.ip}, #{dn}"
        else
          request_hosts = Resolv.new.getnames(request.ip)
        end
      elsif SETTINGS[:require_ssl]
        logger.warn "SSL is required - request from #{request.ip}"
      else
        request_hosts = Resolv.new.getnames(request.ip)
      end
      return false unless request_hosts

      hosts = Hash[proxies.map { |p| [URI.parse(p.url).host, p] }]
      allowed_hosts = hosts.keys.push(*Setting[:trusted_puppetmaster_hosts])
      logger.debug { ("Verifying request from #{request_hosts} against #{allowed_hosts.inspect}") }
      unless host = allowed_hosts.detect { |p| request_hosts.include? p }
        logger.warn "No Capsule server found on #{request_hosts.inspect} and is not in trusted_puppetmaster_hosts"
        return false
      end
      @detected_proxy = hosts[host] if host
      true
    end
  end
end
