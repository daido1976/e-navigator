class NotificationMailer < ApplicationMailer
  def send_when_confirm(interviewer, interviewee, interview)
    @interviewer = interviewer
    @interviewee = interviewee
    @interview = interview
    mail to: @interviewee.email, subject: "面接日程が確定しました！"
  end
end
