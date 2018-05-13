
require_relative "libraries/numeric_monkeypatch"
require_relative "generator"

require "rasem"

if $PROGRAM_NAME == __FILE__
  # maze = ARGV.shift

  # Random::srand(174244244925392674317086725143365111051)

  n                = 4
  board_dimensions = [n, n]
  pieces           = n
  space            = []

  for i in 0..4 do
    space << []
  end

  puts "N queens problem, where N is: #{n}"

  puts "random::srand() : #{Random::srand()}"

  #
  # position the pieces
  #

  pieces = [] #{x: 0, y: 1}, {x: 1, y: 3}

  

  #
  # create svg output
  #

  File.open("test.svg", "w") do |f|
    w, h = [1920, 1080]

    Rasem::SVGImage.new({width: w, height: h}, f) do

      rect(0, 0, w, h, fill: "#FFEFCC", stroke: "#E8DBAE");

      if false
        color = "#CCDEFF"
      elsif false
        color = "#9DB26B"
      else
        color = "#9E6BB2"
      end

      w_tile = w/board_dimensions[0]
      h_tile = h/board_dimensions[0]

      # draw the board

      for x in 0..board_dimensions[0] do
        for y in 0..board_dimensions[1] do
          color = (x+y) % 2 == 0 ? "#B6E1E7" : "#FFEFCC"
          rect(x*w_tile, y*h_tile, w_tile, h_tile, fill: color, stroke: "none");
        end
      end

      # draw the pieces

      color = "#F1CBED"

      for piece in pieces do
        circle(
          piece[:x]*w_tile + w_tile/2.0,
          piece[:y]*h_tile + h_tile/2.0,
          [w_tile, h_tile].min*0.45,
          fill: color
        )
      end

      # circle(p1.x, p1.y, node.radius*scale, fill: color)

      # text(p1.x, p1.y, :fill => "#3A2D40") { raw node.uniqid }

      # def l(start, stop, *extra)
      #   line(start.x, start.y, stop.x, stop.y, *extra)
      # end

      # circle(offset.x, offset.y, g.space_radius*scale, stroke: "red", stroke_opacity: "1.0", fill_opacity: "0.0")
    end
  end
end
