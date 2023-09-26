FROM golang:1.21.1-alpine3.18 AS builder

WORKDIR /app

COPY /app/go.mod ./
COPY /app/main.go ./

RUN go build -o /fullCycle


FROM scratch

WORKDIR /

COPY --from=builder /fullCycle /fullCycle

CMD [ "/fullCycle" ] 
	