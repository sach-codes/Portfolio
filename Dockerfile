FROM nginx:1.27-alpine

# Serve the app as a static site on Railway's assigned PORT.
COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY index.html /usr/share/nginx/html/index.html
COPY README.md /usr/share/nginx/html/README.md
COPY LICENSE /usr/share/nginx/html/LICENSE

# Railway injects PORT at runtime. NGINX official image will envsubst templates
# from /etc/nginx/templates/*.template before startup.
ENV PORT=8080

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
