#!/usr/bin/env ruby

require 'json'
require 'webrick'
include WEBrick

class Test < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(req, res)
    ret = ''
    i = 1
    cut = JSON.parse(req.body)['string_to_cut']
    cut.each_char { |ch|
      if (i % 3) == 0
        ret << ch
      end
      i += 1
    }
    res.status = 200
    res.body = JSON.generate({:return_string => ret})
    res['Content-Type'] = 'application/json'
  end
end

server = WEBrick::HTTPServer.new :Port => 8000

trap 'INT' do server.shutdown end

server.mount('/test', Test)
server.mount('/index', HTTPServlet::FileHandler, '/home/yisroel/code/split3-post-request/index.html')
server.start

# curl -X POST -d "{\"string_to_cut\": \"iamyourlyftdriver\"}" http://localhost:8000/test && echo ""
# curl -X POST -d "{\"string_to_cut\": \"iamyourlyftdriver\"}" http://localhost:8000/test -w "\n"


