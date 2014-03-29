class WsController < ApplicationController

  def answering_machine
    if !params["echostr"].blank?
      # to validate who we are
      # TODO, xss here, check identity of sender before returning
      return render text: params["echostr"]
    end

    xml = Nokogiri::XML(request.body.read)
    type = xml.xpath("//xml/MsgType").text
    puts "--request type is: #{type}"
    if type == "text"
      content = xml.xpath("//xml/Content").text
      him = xml.xpath("//xml/FromUserName").text
      me = xml.xpath("//xml/ToUserName").text
      now = Time.now.to_i
      msg = menu(content)
      x = "<xml><ToUserName><![CDATA[#{him}]]></ToUserName><FromUserName><![CDATA[#{me}]]></FromUserName><CreateTime>#{now}</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[#{msg}]]></Content></xml>"
      
    end

    render :xml => x
  end

  private
  def menu(msg)
    {"x" => "users - to list users\nevent - to list the next event\nfoo - to bar baz"}.fetch(msg, "Sorry, i don't know this command :(")
  end

end
