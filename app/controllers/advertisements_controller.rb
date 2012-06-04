
class AdvertisementsController < ApplicationController
  
  before_filter :get_advertisement
  before_filter :init_session
  
  def show
    # ad_ident = params[:ident] rescue 'unknown'
    
    @event = Event.new
    @event.event_type = params[:t] || 'c'
    @event.ad_ident = @ad.ident
    @event.ad_gen_time = params[:atime]
    @event.uniqueuser = @uniqueuser
    @event.user_agent = request.env['HTTP_USER_AGENT']
    @event.ip = request.remote_ip
    @event.save
    
    redirect_to @ad.targeturl
  end
  
  private
  
  def get_advertisement
    @ad = Advertisement.find_by_ident(params[:ident])
    unless @ad
      # render :text => "404 Not Found", :status => 302
      render :text => "Advertisement redirect not found", :status => 200
    end
  end
  
  def init_session
    session[:uniqueuser] ||= SecureRandom.hex(10)
    @uniqueuser = session[:uniqueuser]
  end
end
