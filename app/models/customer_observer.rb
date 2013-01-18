class CustomerObserver < ActiveRecord::Observer
	def after_create(user)
    CustomerMailer.delay.registration_confirmation(user)
  end
end
