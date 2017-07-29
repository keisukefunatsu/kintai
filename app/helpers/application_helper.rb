module ApplicationHelper
  def create_in_date(user)
    user.in_dates.create(user_id: user.id, in: Time.current)
    @time = Time.current
    @status = 'in'
    PostMailer.post_email(user, @status, @time).deliver
    user.update(present: '1')
  end

  def create_out_date(user)
    user.out_dates.create(user_id: user.id, out: Time.current)
    @time = Time.current
    @status = 'out'
    PostMailer.post_email(user, @status, @time).deliver
    user.update(present: '2')
  end

  def check_in_date(user)
    past_time = user.in_dates.last
    current_time = Time.now
    if current_time - past_time > 5.minutes
      true
    else
      false
    end
  end
end
