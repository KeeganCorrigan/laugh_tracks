RSpec.describe 'a visitor' do
  context 'visits /comedians' do
    it 'sees a list of comedians' do
      comic_1 = Comedian.create(name: "bias",  age: 32)
      comic_2 = Comedian.create(name: "blimey",  age: 40)

      visit '/comedians'

      expect(page).to have_content(comic_1.name)
      expect(page).to have_content("Age: #{comic_2.age}")
    end
    it 'sees a list of comedians specials' do
      comic_1 = Comedian.create(name: "bias",  age: 32)
      special_1 = comic_1.specials.create(name: "fake special")
      special_2 = comic_1.specials.create(name: "fake special 2")

      visit '/comedians'

      expect(page).to have_content(special_1.name)
      expect(page).to have_content(special_2.name)
    end
    it 'sees the average age of all comedians' do
      comic_1 = Comedian.create(name: "bias",  age: 32)
      comic_2 = Comedian.create(name: "bads",  age: 40)
      expected = 36

      visit '/comedians'

      expect(page).to have_content("Average age: #{expected}")
    end
    it 'sees comedians by age provided in query' do
      comic_1 = Comedian.create(name: "bias",  age: 32)
      comic_2 = Comedian.create(name: "bads",  age: 40)

      visit '/comedians?age=32'

      expect(page).to have_content(comic_1.name)
      expect(page).not_to have_content(comic_2.name)
    end
    it 'sees a count of specials for each comedian' do
      comic_1 = Comedian.create(name: "bias",  age: 32)
      special_1 = comic_1.specials.create(name: "fake special")
      special_2 = comic_1.specials.create(name: "fake special 2")
      expected = 2

      visit '/comedians'

      expect(page).to have_content("Specials count: #{expected}")
    end
  end
end

# As a visitor,
# When I visit `/comedians`
# Then I also see the count of specials for each comedian.
