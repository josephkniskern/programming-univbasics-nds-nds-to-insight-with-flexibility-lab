# Getting Insight from Nested Data Structures (Flexibly)

## Learning Goals

-SWBAT 1
-SWBAT 2

## Introduction

So far, we've seen the power of wrapping "primitive" Ruby calls in methods.
This method of constructing programs is superior due to readability and
maintainability when compared to "writing one big old set of nested loops."

But sometimes it's not so clear how to get from our given NDS to the NDS that
we might _have_ to get in order to please ourselves, a customer, or a boss.

Sometimes we need to think _flexibly_ and work from what we're given and get
_one_ tiny step closer to the final gaol; or, maybe we need to know what the goal
is and get one step away from it toward the _given_ NDS. We like to call this
approach the "see-saw" approach (or "teeter-totter"). The idea is that Ruby is
your partner on the see-saw: you get a step closer to it, it gets a step closer
to you. You meet in the middle and share in the glory of the solution.

## SWBAT 1

Lets reconsider our vending machine. We'd like to analyze the machine's
inventory and determine how many snacks have a given number of pieces. Some
might have 3 pieces, some might have 1. We'd like that information.

Recalling the effort we took to print out and understand the vending machine
NDS, we know that the NDS is not set up to give us that information easily. We
need to transform this _given_ NDS into something else, a _new_ NDS, that
allows us to derive _insights_ from _it_.

This very much mirrors some real-world use of 3<sup>rd</sup> party information.
A Wiki of Ice and Fire (a site with information about the popular "Song of Ice
and Fire" book series) has tons of information that it returns as an NDS. To
get information we want out if it, we'll need to transform their _given_ data
to a form that provides the answers _we_ want.

### See-...

```ruby
vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies",
:pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip
Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12},
{:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters",
:pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour
Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy
Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange
Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints",
:pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US
Mints", :pieces=>99}]]]
```

Look at the given NDS. Where are the `:pieces` data?

### -Saw...

What do we want? Something like:

```ruby
# Not runnable!
{
  3 => { :count => 4, :items => ["Vanilla Cookies"...], 
 1000 => { :count => 1, :items => ["Curiously Toxic Mints"...]
}
```

### See-...

Could we create an Array of all the snacks? Could we "pop" them out of the
AoAoA and flatten them into a single `Array`? Then we could have something
that's much easier to work with.

### ...Saw

Write a method to transform the NDS into an `Array` of `Hashes.

### See...


```ruby
vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies",
:pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip
Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12},
{:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters",
:pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour
Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy
Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange
Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints",
:pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US
Mints", :pieces=>99}]]]

def snack_collection(machine)
  flat_snack_collection = []
  row_index = 0
  while row_index < machine.length do
    column_index = 0
    while column_index < machine[row_index].length do
      inner_len = machine[row_index][column_index].length
      inner_index = 0
      while inner_index < inner_len do
        flat_snack_collection <<
          machine[row_index][column_index][inner_index]
        inner_index += 1
      end
      column_index += 1
    end
    row_index += 1
  end
  flat_snack_collection
end

p snack_collection(vm)
```

Outputs:

```ruby
[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies", :pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip\nCookies", :pieces=>3}, {:name=>"Tooth-Melters", :pieces=>12}, {:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters", :pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}, {:name=>"Gummy Sour\nApple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy\nApple", :pieces=>1}, {:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange\nDrink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}, {:name=>"Mints", :pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US\nMints", :pieces=>99}]
```

Let's give this `Array` a name to make this lesson clearer, let's call this the
"Snacks `Array`"

### We Interrupt this -Saw...

Not bad, right! Using some simple iteration we were able to transform the
_given_ NDS into something that has all the raw data we need to get our
answers. Now all we need to do is build our strategy from the finish _back_ to
this new NDS we just created.

### -Saw...

We know we want a `Hash` like:

```ruby
# Not runnable!
{
  3 => 4, # 4 candies
  1000 => 1 ...
}
```

To make things clearer, we'll call this the "Summary `Hash`." If we had some
sort of NDS with all the snacks and their `:pieces` count we could loop through
that `Array` and create an `Hash` of "piece count" keys that point to a "number
of snacks" `Integer` values.

But wait, we **DO** have that! We've "met in the middle." We should feel very
excited since we know we're now home free!  So the trick is to transform the
"Snacks `Array` into the "Summary `Hash`" we just showed. 

### See-...

Let's transform that snacks `Array` into the "Summary `Hash`".

```ruby
vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies",
:pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip
Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12},
{:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters",
:pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour
Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy
Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange
Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints",
:pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US
Mints", :pieces=>99}]]]

def snack_collection(machine)
  flat_snack_collection = []
  row_index = 0
  while row_index < machine.length do
    column_index = 0
    while column_index < machine[row_index].length do
      inner_len = machine[row_index][column_index].length
      inner_index = 0
      while inner_index < inner_len do
        flat_snack_collection <<
          machine[row_index][column_index][inner_index]
        inner_index += 1
      end
      column_index += 1
    end
    row_index += 1
  end
  flat_snack_collection
end

def summary_by_pieces(snacks)
  result = {}
  i = 0

  while i < snacks.length do
    snack_name = snacks[i][:name]
    snack_pieces = snacks[i][:pieces]
    # If there's no key for this number, add the number as a key and assign it
    # a new Array for holding future snacks with that number of pieces.
    if !result[snack_pieces]
      result[snack_pieces] = [ snack_name ]
    else
      result[snack_pieces] << snack_name
    end
    i += 1
  end

  result
end

def summary_snack_count_by_pieces(snacks)
  result = {}
  i = 0

  while i < snacks.length do
    snack_name = snacks[i][:name]
    snack_pieces = snacks[i][:pieces]
    # If there's no key for this number, add the number as a key and assign it
    # a new Array for holding future snacks with that number of pieces.
    if !result[snack_pieces]
      result[snack_pieces] = 1
    else
      result[snack_pieces] += 1
    end
    i += 1
  end

  result
end

pieces_collection = snack_collection(vm)
count_to_itemnames = summary_by_pieces(pieces_collection) 
p summary_snack_count_by_pieces(pieces_collection)
```

Outputs:

```ruby
{3=>5, 12=>3, 20=>1, 5=>1, 1=>4, 13=>1, 1000=>1, 99=>1}
```

Look at that! We have that thing we wanted!

## Lab

In the lab you're going to transform the given data into a `Hash` with
information about various move studios. Use the see-saw technique to work from
the given NDS, to an NDS of your making that provides _insights_.

## Conclusion

## Resources
