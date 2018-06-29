RSpec.describe 'a visitor' do
  context 'visiting /comedians' do
    it 'should see a list of comedians' do
      Comedian.create(name: "Iliza Shlesinger", age: 34)

      visit '/comedians'

      within("ul") do
        expect(page).to have_content("Iliza Shlesinger")
        expect(page).to have_content("34")
      end
    end
    it 'should see a list of comedians specials' do
      iliza = Comedian.create(name: "Iliza Shlesinger", age: 34)
      Special.create(name: "War Paint", comedian_id: iliza.id)
      Special.create(name: "Freezing Hot", comedian_id: iliza.id)
      Special.create(name: "Confirmed Kills", comedian_id: iliza.id)

      visit '/comedians'

      within("ul") do
        expect(page).to have_content("War Paint")
      end
    end
    it 'should see the number of specials for that comedian' do
      iliza = Comedian.create(name: "Iliza Shlesinger", age: 34)
      Special.create(name: "War Paint", comedian_id: iliza.id)
      Special.create(name: "Freezing Hot", comedian_id: iliza.id)
      Special.create(name: "Confirmed Kills", comedian_id: iliza.id)

      visit '/comedians'

      within("#special-count") do
        expect(page).to have_content("3")
      end
    end
    it 'should see a list of comedians average age' do
      iliza = Comedian.create(name: "Iliza Shlesinger", age: 34)
      barry = Comedian.create(name: "Billy Shlesinger", age: 30)

      visit '/comedians'

      within("#average-age") do
        expect(page).to have_content("32")
      end
    end
    # it 'should be able to query for age and see comedians by age'
    #   iliza = Comedian.create(name: "Iliza Shlesinger", age: 34)
    #   barry = Comedian.create(name: "Billy Shlesinger", age: 30)
    #
    #   visit '/comedians?age=34'
    #
    #   within("ul")
    #     expect(page).to have_content("Iliza Shlesinger")
    #     expect(page).to_not have_content("Billy Shlesinger")
    #   end
    # end
  end
end
