# Numbered List

This library was built to make it easy to manage value objects/enums.


Example Usage: 
```ruby
class NumberedList::Colors < NumberedList::List
  item({name: "RED",
        formatted: "Red",
        order_value: 1,
        description: "This #FF0000"})
  item({name: "WHITE",
        formatted: "White",
        order_value: 2,
        description: "This is #FFFFFF"})

end
```
`

## Examples of usage

```ruby
NumberedList::Colors.red.name == "RED"
NumberedList::Colors.red.red? == true
NumberedList::Colors.blue.red? == false
NumberedList::Colors.types == ["RED", "BLUE"]
NumberedList::Colors.find_item("RED") == NumberedList::Colors.red
NumberedList::Colors.as_objs == [NumberedList::Colors.red, NumberedList::Colors.blue]
```
