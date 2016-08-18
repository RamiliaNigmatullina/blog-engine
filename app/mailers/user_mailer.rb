class UserMailer < ApplicationMailer
  default from: ENV.fetch("MAILER_SENDER_ADDRESS")

  def new_post(post)
    users_id = Subscription.where(blog: post.blog).pluck(:user_id)
    users_email = []
    users_id.each do |user_id|
      user = User.find_by id: user_id
      users_email << user.email
    end
    mail(to: users_email,
         body: post.body,
         content_type: "text/html",
         subject: "New post in #{post.user.full_name}'s blog")
  end

  def new_comment(comment)
    mail(to: comment.post.user.email,
         body: "#{comment.user.full_name} commented your post '#{comment.post.title}': #{comment.body}.",
         content_type: "text/html",
         subject: "New comment under your post #{comment.post.title}")
  end
end
