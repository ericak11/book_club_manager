class EventNotifier < ApplicationMailer
  def send_new_event_email(event, creator)
    @event = event
    mail( :to => User.members.collect(&:email),
          :from => creator.email,
          :subject => "Please Join Us on #{@event.date} for Book Club!" )
  end
end
