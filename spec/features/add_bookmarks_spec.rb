feature "add new bookmark" do
  scenario "user can add new bookmark" do
    visit "/bookmarks"
    fill_in 'url', with:'https://www.yahoo.com/'
    click_button 'Submit'
    expect(page).to have_content 'https://www.yahoo.com/'
  end
end