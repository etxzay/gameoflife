# Gameoflife

{<img src="https://codeclimate.com/github/etxzay/gameoflife.png" />}[https://codeclimate.com/github/etxzay/gameoflife]
<a href="https://codeclimate.com/github/etxzay/gameoflife"><img src="https://codeclimate.com/github/etxzay/gameoflife/badges/gpa.svg" /></a>

Conway's Game of Life

wiki links: <a href="https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life">en</a> <a href="https://ru.wikipedia.org/wiki/%D0%96%D0%B8%D0%B7%D0%BD%D1%8C_(%D0%B8%D0%B3%D1%80%D0%B0)">ru</a>

## Installation

```ruby
gem 'gameoflife'
```

Build:

    $ gem build gameoflife.gemspec

and install:

    $ gem install gameoflife

## Usage

Create CSV text file which contains coordinates. First row consider to contain field size (width, height). It produces console output for the each step. Pause between steps is about 2 seconds.

irb> require 'gameoflife'
irb> include Gameoflife
irb> init("filename")
irb> play

'X' - stands for live cell
'O' - stands for dead cell

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gameoflife/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
