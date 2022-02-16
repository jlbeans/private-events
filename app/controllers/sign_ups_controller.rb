class SignUpsController < ApplicationController
  before_action :authenticate_user!

  def create
  @sign_up=SignUp.new
  @sign_up.attendee_id=params[:sign_up][:attendee_id]
  @sign_up.attended_event_id=params[:sign_up][:attended_event_id]

  if @sign_up.save
    flash[:notice]="You have successfully signed up for the event!"
  else
    flash[:alert]="Something went wrong..."
  end
  redirect_to @sign_up.attended_event
end


  def destroy
    @sign_up= SignUp.find(params[:id])
    @event = @sign_up.attended_event
    @sign_up.destroy

    flash[:notice]="You have cancelled your reservation..."
    redirect_to @event
  end
 end
