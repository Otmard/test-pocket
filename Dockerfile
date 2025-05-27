FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache curl unzip

RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v0.21.0/pocketbase_0.21.0_linux_amd64.zip \
  && unzip pb.zip \
  && chmod +x pocketbase \
  && rm pb.zip

VOLUME ["/app/pb_data"]

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=pb_data" , "--cors"]