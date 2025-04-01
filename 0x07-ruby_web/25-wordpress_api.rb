#!/usr/bin/env ruby

opts = 
    {
        host: '127.0.0.1',
        path: '/xmlrpc.php',
        port: 80,
        proxy_host: nil,
        proxy_port: nil,
        user: 'admin',
        password: '123123',
        use_ssl: false,
        timeout: 30
    }

#create new instance
server = XMLRPC::Client.new(
    opts[:host], opts[:path], opts[:port],
    opts[:proxy_host], opts[:proxy_port],
    opts[:user], opts[:password],
    opts[:use_ssl], opts[:timeout]
)

#create new instance takes hash
server = XMLRPC::Client.new3(opts)

#send message to WordPress
response = server.call("demo.sayHello")

#list all available methods
server.call('system.listMethods', 0)

#list all available users
response = server.call('wp.getAuthors', 0, opts[:user], opts[:pasword])

#list all available posts
reponse = server.call('wp.getPosts', 0, opts[:user], opts[:password])
