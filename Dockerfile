FROM golang:1.21 AS builder

WORKDIR /app

COPY /app/go.mod ./
COPY /app/main.go ./

RUN go build -o /fullCycle


FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=builder /fullCycle /fullCycle

USER nonroot:nonroot

CMD [ "/fullCycle" ] 
	