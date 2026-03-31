FROM nginx:alpine

LABEL org.opencontainers.image.title="workstation-custom-web"
LABEL org.opencontainers.image.description="Custom nginx image for codyssey mission"

ENV APP_ENV=dev

COPY site/ /usr/share/nginx/html/
EXPOSE 80
