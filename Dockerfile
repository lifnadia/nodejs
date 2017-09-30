#image include NPM and node
FROM node:argon

#install express
RUN sudo npm install -g -express-generator

#run express
RUN express myapp
RUN cd "myapp"

#run npm install
RUN npm install

#redirect port 80 to 3000
RUN sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000 

#run application
RUN npm start



