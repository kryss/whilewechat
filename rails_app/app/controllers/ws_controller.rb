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
      puts "--message reveived: #{content}"
    end


    render json: {:params => params, :body => request.body.read}
  end
end
