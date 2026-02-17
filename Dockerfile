FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

#first dot source code and second docker container working directory
COPY . .

RUN npm run build

EXPOSE 3000 
CMD ["node", "dist/main"]

