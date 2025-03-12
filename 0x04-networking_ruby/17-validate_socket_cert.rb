#!/usr/bin/env ruby
#
#validate socket

require 'socket'
require 'openssl'

def validate_socket_cert(target)
  ssl_context = OpenSSL::SSL::SSLContext.new
  ssl_context.verify_mode = OpenSSL::SSL::VERIFY_PEER
  cert_store = OpenSSL::X509::Store.new
  cert_store.set_default_paths
  ssl_context.cert_store = cert_store
  socket = TCPSocket.new(target, 443)
  ssl_socket = OpenSSL::SSL::SSLSocket.new(socket, ssl_context)
  begin
    ssl_socket.connect
    puts '[+] Valid SSL Certificate!'
  rescue OpenSSL::SSL::SSLError
    puts '[+] Invalid SSL Certificate!'
  end
end

good_ssl = 'google.com'
bad_ssl = 'expired.badssl.com'

validate_socket_cert good_ssl
validate_socket_cert bad_ssl
