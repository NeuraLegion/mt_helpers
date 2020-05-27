# mt_helpers

Helper shard for MT in Crystal

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     mt_helpers:
       github: NeuraLegion/mt_helpers
   ```

2. Run `shards install`

## Usage

This shard give two new structures, `Synchronized` and `Synchronizable`
they can be used differently.

Synchronized:

```crystal
require "mt_helpers"

synchronized_array = Synchronized(Array(String)).new(
  [
    "a",
    "b",
    "c"
  ]
)

synchronized_array.each
synchronized_array << "d"
synchronized_array.safe_inner # returns a clone of the inner object
```

The above will create a MultiThread safe Array.

Synchronizable:

```crystal
require "mt_helpers"

class Foo
  include Synchronizable

  def safe_loop
    synchronize do
      @a << "a"
    end
  end
end

```

## Contributing

1. Fork it (<https://github.com/NeuraLegion/mt_helpers/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Bar Hofesh](https://github.com/bararchy) - creator and maintainer
