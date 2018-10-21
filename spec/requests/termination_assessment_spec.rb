require 'requests/acceptance_helper'

feature 'TEACHER::CREATE:TERMINATION_ASSESSMENT', '
  As a teach
  I want to fill out the first year assessment form
  So that I can create a new kid
' do
  background do
    @teacher = create(:teacher)
    @admin = create(:admin)
    @kid = create(:kid, teacher: @teacher, admin: @admin)
    log_in(@teacher)
    visit kid_path(@kid)
  end

  scenario 'fill in default data value' do
    click_link 'Neues Abschlussgespräch'
    expect(page.status_code).to eq(200)
    expect(find_field('* Lehrperson', type: :select).text).to match(@teacher.name)
  end

  scenario 'should create a new assessment with required values' do
    click_link 'Neues Abschlussgespräch'
    click_button 'Abschlussgespräch erstellen'
    expect(page.status_code).to eq(200)
    expect(page).to have_css('h4', text: 'Abschlussgespräch vom ')
    expect(ActionMailer::Base.deliveries.length).to eq(1)
  end


end
