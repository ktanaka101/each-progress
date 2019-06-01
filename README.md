# each-progress

Simple progress bar.  
Supports only each.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     each_progress:
       github: ktanaka101/each-progress
   ```

2. Run `shards install`

## Usage

### Pass an object that can call each method

```crystal
require "each_progress"

EachProgress.by(0...100) do |_|
  # Some processing...
  sleep 0.1
end

# Progress will be displayed.
```

<img src="example.gif" height="48px" alt="example">

## Contributing

1. Fork it (<https://github.com/ktanaka101/each-progress/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [ktanaka101](https://github.com/ktanaka101) Kentaro Tanaka - creator and maintainer
