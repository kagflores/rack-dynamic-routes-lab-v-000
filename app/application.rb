class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      binding.pry
      item = @@items.find{|i| i.name == item_name}
      if item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{item.name} is #{item.price}"
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
