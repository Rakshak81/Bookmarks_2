feature "add new bookmark" do
  scenario "user can add new bookmark" do
    visit "/bookmarks"
    fill_in 'url', with:'https://www.yahoo.com/'
    fill_in 'title', with:'Yahoo'
    click_button 'Submit'
    expect(page).to have_content 'Yahoo'
  end
end