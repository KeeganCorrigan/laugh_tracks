RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
  context 'class methods' do
    describe 'average_age' do
      it 'should return average_age of all comedians' do
        comic_1 = Comedian.create(name: "bias",  age: 32)
        comic_2 = Comedian.create(name: "bads",  age: 40)
        expected = 36

        expect(Comedian.average_age).to eq(expected)
      end
    end
  end
  context 'instance methods' do
    describe 'specials_count' do
      it 'should return total number of specials per comedian' do
        comic_1 = Comedian.create(name: "bias",  age: 32)
        special_1 = comic_1.specials.create(name: "fake special")
        special_2 = comic_1.specials.create(name: "fake special 2")
        expected = 2

        expect(comic_1.specials_count).to eq(expected)
      end
    end
  end
end
