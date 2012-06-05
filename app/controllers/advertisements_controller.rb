
class AdvertisementsController < ApplicationController
  
  before_filter :get_advertisement
  before_filter :init_session
  
  def show
    
    # fill and save event to database
    build_event
    
    # redirect to advertisement targeturl
    redirect_to @ad.targeturl
  end
  
  private
  
  def get_advertisement
    @ad = Advertisement.find_by_ident(params[:ident])
    
    # render info or redirect to default url?
    unless @ad
      # redirect_to "http://default-url.com/"
      render :text => "Advertisement not found", :status => 200
    end
  end
  
  # init uniqueuser for request
  def init_session
    session[:uniqueuser] ||= SecureRandom.hex(10)
    @uniqueuser = session[:uniqueuser]
  end
  
  # params:
  # t - event type, ex: c - for click
  # atmime - time of generation advertisement
  def build_event
    @event = Event.new
    @event.event_type = params[:t] || 'c'
    @event.ad_ident = @ad.ident
    @event.ad_gen_time = params[:atime]
    @event.uniqueuser = @uniqueuser
    @event.user_agent = request.env['HTTP_USER_AGENT']
    @event.ip = request.remote_ip
    @event.save
  end
  
end
