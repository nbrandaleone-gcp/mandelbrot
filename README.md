# mandelbrot
## July 2024

This program generates an ascii output of the Mandelbrot Set.
Based upon an example, from the Crystal docs: https://github.com/crystal-lang/crystal/blob/master/samples/mandelbrot.cr

## Installation

One needs Crystal installed, or a compiled version of the program.

## Usage

Create a container using the supplied Dockerfile, or use the enclosed Makefile
to run the Crystal code directly  `make run`.
The code will run a local web server on port 8080.

## Development
### https://crystal-lang.org/reference/1.13/man/crystal/index.html

How to run your code

```bash
crystal run mandelbrot.cr

crystal build mandelbrot.cr
./mandelbrot

# Release quality
crystal build mandelbrot.cr --release
```

## Useful Google Cloud commands
gcloud artifacts docker images list

gcloud artifacts repositories describe my-docker-repo --project testing-355714 --location us-central1

gcloud artifacts docker images list us-central1-docker.pkg.dev/testing-355714/my-docker-repo/mandelbrot
gcloud artifacts docker images list us-central1-docker.pkg.dev/testing-355714/my-docker-repo/mandelbrot --include-tags

gcloud artifacts files list

gcloud artifacts docker images scan --remote \
us-central1-docker.pkg.dev/testing-355714/my-docker-repo/mandelbrot@sha256:2751dccae2395490887933ed5dba01ea973a90f17813f2d1998b533e267d05c1

## Contributing

1. Fork it (<https://github.com/your-github-user/mandelbrot/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Nick Brandaleone](https://github.com/your-github-user) - creator and maintainer
