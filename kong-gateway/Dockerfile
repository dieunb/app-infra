#####################
## Go plugins
#####################
FROM kong:2.0.4-ubuntu as compiler

USER root

# Install build tools
RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git

# Download and configure Go compiler
RUN curl -s https://dl.google.com/go/go1.14.13.linux-amd64.tar.gz | tar -v -C /usr/local -xz
ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin

# Copy and compile go-plugins
COPY ./go-plugins /usr/src/go-plugins
RUN cd /usr/src/go-plugins && make

RUN git clone https://github.com/Kong/go-pluginserver /usr/src/go-pluginserver
RUN cd /usr/src/go-pluginserver && make

#####################
## Release image
#####################
FROM kong:2.0.4-ubuntu

USER root
# Copy Kong configuration if you have some customization
# COPY conf/kong.conf /etc/kong/kong.conf

# Copy Go files
COPY --from=compiler /usr/src/go-plugins/*.so /usr/local/go-plugins/
RUN chmod -R 755 /usr/local/go-plugins/*.so

COPY --from=compiler /usr/src/go-pluginserver/go-pluginserver /usr/local/bin/go-pluginserver
RUN chmod -R 755 /usr/local/bin/go-pluginserver

USER kong
