class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/items/").last
      item_object = @@items.detect { |item| item.name == item_name }
      
      if item_object
        resp.status = 200
        resp.write("#{item_object.price}")
      else
        resp.status = 400
        resp.write("Item not found")
      end

    else
      resp.status = 404
      resp.write("Route not found")
    end

    resp.finish
  end
end
