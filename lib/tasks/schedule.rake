namespace :schedule do
  desc 'Run conditionally_create_reminders as schedulable task'
  task create_reminders: :environment do
    Reminder.conditionally_create_reminders
  end

  desc 'Run conditionally_send_no_kids_reminders as schedulable task'
  task send_no_kid_reminders: :environment do
    Mentor.conditionally_send_no_kids_reminders
  end

  desc 'Run conditionally_send_journals as schedulable task'
  task send_journals: :environment do
    Teacher.conditionally_send_journals
  end
end
