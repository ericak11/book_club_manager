class EventNotifier < ApplicationMailer
  def send_new_event_email(event, creator)
    @event = event
    mail( :to => User.members.collect(&:email),
          :from => creator.email,
          :subject => "Please Join Us on #{Date.parse(@event.date).strftime("%A %b %d, %Y")} for Book Club!" )
  end
end
