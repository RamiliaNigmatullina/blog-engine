class UserMailer < ApplicationMailer
  default from: ENV.fetch("MAILER_SENDER_ADDRESS")

  def new_post(post)
    users_email = User.where(id: Subscription.where(blog: post.blog).select(:user_id)).pluck(:email)
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
