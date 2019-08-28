require 'minitest/autorun'
require 'numbered_list'


class NumberedList::Colors < NumberedList::List
  item({name: "RED",
        formatted: "Red",
        order_value: 1,
        description: "This #FF0000"})
  item({name: "BLUE",
        formatted: "Blue",
        order_value: 2,
        description: "This is #00FF00"})

end

RSpec.describe NumberedList do


  context "Red Color" do

    it "knows the name" do
      expect(NumberedList::Colors.red.name).to eq("RED")
    end
    it "knows the formatted" do
      expect(NumberedList::Colors.red.formatted).to eq("Red")
    end
    it "knows the order_value" do
      expect(NumberedList::Colors.red.order_value).to eq(1)
    end
    it "knows the description" do
      expect(NumberedList::Colors.red.description).to eq("This #FF0000")
    end
    it "knows that it is red" do
      expect(NumberedList::Colors.red.red?).to be true
    end
    it "knows that it is not blue" do
      expect(NumberedList::Colors.red.blue?).to be false
    end
  end
  context "List" do
    it "knows the types" do
      expect(NumberedList::Colors.types).to eq(["RED", "BLUE"])
    end
    it "knows the objs" do
      expect(NumberedList::Colors.as_objs).to eq([NumberedList::Colors.red, NumberedList::Colors.blue])
    end
    it "can find red" do
      expect(NumberedList::Colors.find_item("RED").name).to eq(NumberedList::Colors.red)
    end
  end
end