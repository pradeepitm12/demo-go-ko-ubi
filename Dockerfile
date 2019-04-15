FROM registry.access.redhat.com/ubi8-dev-preview/ubi 
RUN \
  mkdir -p /goroot && \
  curl https://storage.googleapis.com/golang/go1.10.2.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1

# Set environment variables.
ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

# Define working directory.
WORKDIR /gopath
RUN mkdir /app 
ADD . /app/ 
WORKDIR /app
EXPOSE 8080 
RUN go build -o main . 
CMD ["/app/main"]
