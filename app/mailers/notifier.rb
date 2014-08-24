class Notifier < ActionMailer::Base
	default_url_options[:host] = "todolistitem.herokuapp.com"
  default from: "no-reply@todolistitem.herokuapp.com"

  def password_reset(user)
  	@user = user
  	mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>",
  			 subject: "Reset Your Password!")
  end

	def todo_list(todo_list, destination)
		@user = todo_list.user
		@todo_list = todo_list
		destination = destination
		mail(to: destination, subject: "#{@user.first_name} sent you a todo list.")
	end
end
