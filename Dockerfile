# Dockerfile
#FROM crystallang/crystal:latest
FROM crystallang/crystal:1.12.2

ADD . /src
WORKDIR /src

RUN crystal build --release --no-debug src/mandelbrot.cr

# In an effort to reduce container size, we use SCRATCH, and only
# copy over required libraries, as determined by linker.
# Probably overkill, but it works.
RUN ldd ./mandelbrot | tr -s '[:blank:]' '\n' | grep '^/' | \
    xargs -I % sh -c 'mkdir -p $(dirname deps%); cp % deps%;'

FROM scratch
COPY --from=0 /src/deps /
COPY --from=0 /src/mandelbrot /mandelbrot

#EXPOSE 8080

ENTRYPOINT ["/mandelbrot"]
