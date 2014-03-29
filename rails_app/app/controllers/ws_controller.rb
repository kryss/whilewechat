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
      @content = xml.xpath("//xml/Content").text
      @him = xml.xpath("//xml/FromUserName").text
      @me = xml.xpath("//xml/ToUserName").text
      @now = Time.now.to_i
      if @content == "1"
        login
      else
        menu
      end        
    end
    render :xml => @ret
  end

  private
  def menu
    msg = "type:\n1 - to login"
    @ret = "<xml><ToUserName><![CDATA[#{@him}]]></ToUserName><FromUserName><![CDATA[#{@me}]]></FromUserName><CreateTime>#{@now}</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[#{msg}]]></Content></xml>"
  end

  def login
    @ret = "<xml><ToUserName><![CDATA[#{@him}]]></ToUserName><FromUserName><![CDATA[#{@me}]]></FromUserName><CreateTime>#{@now}</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[Authentification]]></Title><PicUrl><Url><![CDATA[http://10.0.1.26:3000/auth/wechat]]></Url></item></Articles></xml>"
  end

end
