class Application

  @@items = [Item.new("artichoke", 3.50), Item.new("lemon", 0.50)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)

      item_name == req.path.split("/item/").last
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
