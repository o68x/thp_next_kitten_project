# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hello@nextkittens.com'
  layout 'mailer'
end
