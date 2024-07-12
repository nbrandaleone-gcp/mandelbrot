# Create an ASCII version of the Mandelbrot Set.
# We display the output via a web-server, so we can take advantage of Google Cloud Run

response = ""

def print_density(d)
  if d > 8
    ' '
  elsif d > 4
    '.'
  elsif d > 2
    '*'
  else
    '+'
  end
end

def mandelconverger(real, imag, iters, creal, cimag)
  if iters > 255 || real*real + imag*imag >= 4
    iters
  else
    mandelconverger real*real - imag*imag + creal, 2*real*imag + cimag, iters + 1, creal, cimag
  end
end

def mandelconverge(real, imag)
  mandelconverger real, imag, 0, real, imag
end

def mandelhelp(xmin, xmax, xstep, ymin, ymax, ystep)
  tmp_response = ""

  ymin.step(to: ymax, by: ystep) do |y|
    xmin.step(to: xmax, by: xstep) do |x|
      tmp_response += print_density mandelconverge(x, y)
    end
    tmp_response += '\n'
  end

  tmp_response
end

def mandel(realstart, imagstart, realmag, imagmag)
  mandelhelp realstart, realstart + realmag*78, realmag, imagstart, imagstart + imagmag*40, imagmag
end

# Generate ASCII response
response = mandel -2.3, -1.3, 0.05, 0.07

puts "Generating ASCII Mandelbrot Set"
puts response

# A very basic HTTP server
require "http/server"

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print "An ASCII Mandelbrot Set\n"
  context.response.print response
end

address = server.bind_tcp("0.0.0.0", 8080)
puts "Listening on http://#{address}"

# This call blocks until the process is terminated
server.listen
