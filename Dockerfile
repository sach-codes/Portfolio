FROM nginx:1.27-alpine

# Serve the app as a static site on Railway's assigned PORT.
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
COPY README.md /usr/share/nginx/html/README.md
COPY LICENSE /usr/share/nginx/html/LICENSE

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
