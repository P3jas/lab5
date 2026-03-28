FROM alpine AS builder

ARG VERSION="N/A"

WORKDIR /app

RUN echo "<!DOCTYPE html><html><body>" > index.html && \
    echo "<p>Kacper Kozlinski<br>101603<br>6.4</p>" >> index.html && \
    echo "<h2>Dane:</h2>" >> index.html && \
    echo "<p>Adres IP: $(hostname -i)</p>" >> index.html && \
    echo "<br>Nazwa serwera: $(hostname)</p>" >> index.html && \
    echo "<br>Wersja: ${VERSION}</p>" >> index.html && \
    echo "</body></html>" >> index.html

FROM nginx:alpine

COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

RUN apk --no-cache add curl

HEALTHCHECK --interval=30s --timeout=3s \
    CMD curl -f http://localhost/ || exit 1
