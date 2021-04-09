FROM node:alpine
WORKDIR '/app'
COPY package.json .
#RUN npm config set registry https://repo1.uhc.com/artifactory/api/npm/npm-virtual/
RUN npm install
COPY . .
#RUN npm run build
#RUN  npm install -g npm@7.6.0 
RUN npm run build

FROM nginx
EXPOSE 80
COPY --	from=builder /app/build  /usr/share/nginx/html
