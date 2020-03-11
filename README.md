# Knights Travails

Shows all squares the knight in chess will stop to reach the goal position in the shortest possible way.

## Usage

knight.knight_moves([x axis, y axis], [x axis, y axis])

first parameter = start

second parameter = goal

Input only 0 to 7 as single x and y axis

Ruby

```ruby
knight = Knight.new
knight.knight_moves([0, 0], [7, 7])
```

Run this on the command line

```bash
ruby lib/knights_travails.rb
```

```bash
You made it in 6 moves! Heres your path:
[0, 0]
[1, 2]
[2, 4]
[3, 6]
[4, 4]
[5, 6]
[7, 7]
```
