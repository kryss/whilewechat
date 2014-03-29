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
    @ret = ""
    if type == "text"
      parse_xml(xml)
      if @content == "1"
        login
      else
        menu
      end        
    elsif type == "voice"
      parse_xml(xml)
      you_said
    end
    render :xml => @ret
  end

  private
  def parse_xml(xml)
    puts xml

    @content = xml.xpath("//xml/Content").text
    @recognition = xml.xpath("//xml/Recognition").text
    @him = xml.xpath("//xml/FromUserName").text
    @me = xml.xpath("//xml/ToUserName").text
    @now = Time.now.to_i
  end
  
  def you_said
    @ret = "<xml><ToUserName><![CDATA[#{@him}]]></ToUserName><FromUserName><![CDATA[#{@me}]]></FromUserName><CreateTime>#{@now}</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[you said: #{@recognition}]]></Content></xml>"
  end

  def menu
    msg = "type:\n1 - to login"
    @ret = "<xml><ToUserName><![CDATA[#{@him}]]></ToUserName><FromUserName><![CDATA[#{@me}]]></FromUserName><CreateTime>#{@now}</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[#{msg}]]></Content></xml>"
  end

  def login
    @ret = "<xml><ToUserName><![CDATA[#{@him}]]></ToUserName><FromUserName><![CDATA[#{@me}]]></FromUserName><CreateTime>#{@now}</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[Authentification]]></Title><PicUrl><Url><![CDATA[http://10.0.1.26:3000/auth/wechat]]></Url></item></Articles></xml>"
  end



end
