class NotificationMailer < ApplicationMailer
  def send_when_application(interviewer, interviewee)
    @interviewer = interviewer
    @interviewee = interviewee
    mail to: @interviewer.email, subject: "面接希望日の申請がありました！"
  end

  def send_when_confirm(interviewer, interviewee, interview)
    @interviewer = interviewer
    @interviewee = interviewee
    @interview = interview
    mail to: @interviewee.email, subject: "面接日程が確定しました！"
  end
end
