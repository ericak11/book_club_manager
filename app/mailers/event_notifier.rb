class EventNotifier < ApplicationMailer
  def send_new_event_email(event, creator)
    @event = event
    mail( :to => User.members.collect(&:email),
          :from => creator.email,
          :subject => "Please Join Us on #{Date.parse(@event.date).strftime("%A %b %d, %Y")} for Book Club!" )
  end
  def send_book_added_email(event, creator)
    @event = event
    mail( :to => User.members.collect(&:email),
          :from => creator.email,
          :subject => "Book added for #{Date.parse(@event.date).strftime("%A %b %d, %Y")} Book Club!" )
  end
  def send_event_reminder_email(event, creator)
    @event = event
    mail( :to => User.members.collect(&:email),
          :from => creator.email,
          :subject => "Dont't Forget! Book Club #{Date.parse(@event.date).strftime("%A %b %d, %Y")}" )
  end
  def send_event_update_email(event, updated_info)
    @event = event
    @info = updated_info
    mail( :to => User.members.collect(&:email),
          :from => @event.partner.host.email,
          :subject => "Book Club Update! (#{@info.keys.join(', ').titleize})")
  end
end
