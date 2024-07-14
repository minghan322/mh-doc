FROM node:10.15.1 as builder
WORKDIR /app/
RUN npm install gitbook-cli -g 
COPY . . 
RUN gitbook install
RUN gitbook build 


FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/_book/ .