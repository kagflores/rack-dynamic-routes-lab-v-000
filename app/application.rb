class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      item = @@item.find{|i| i.name == item_name}

      resp.write "#{item.name} costs #{item.price}"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
