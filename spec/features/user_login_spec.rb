# frozen_string_literal: true

require 'rails_helper'
require 'uri'

RSpec.feature 'Login as user' do
  let!(:user) { create :user, password: 'passpass', password_confirmation: 'passpass' }

  scenario 'come to root page and login after two missed try' do
    visit root_path
    expect(page).to have_current_path new_user_session_path

    find('.user--password').set('wrong_passpass')
    find('.user--email').set(user.email)

    find('.user--login-button').click

    expect(page).to have_current_path new_user_session_path
    expect(page.find('.alert')).to have_text 'E-Mail oder Passwort ungültig.'

    find('.user--password').set('passpass')
    find('.user--email').set('wrong@mail.de')

    find('.user--login-button').click

    expect(page).to have_current_path new_user_session_path
    expect(page.find('.alert')).to have_text 'E-Mail oder Passwort ungültig.'

    find('.user--password').set('passpass')
    find('.user--email').set(user.email)

    find('.user--login-button').click

    expect(page).to have_current_path new_user_session_path
    expect(page.find('.alert')).to have_text 'Sie müssen Ihren Account bestätigen, bevor Sie fortfahren können.'
    expect(user.confirm).to eq true

    find('.user--password').set('passpass')
    find('.user--email').set(user.email)

    find('.user--login-button').click

    expect(page).to have_current_path root_path
  end
end
