# Verwende das offizielle Node-Image als Basis
FROM node:slim

# Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# Deaktiviere SSL-Überprüfung für npm
RUN npm config set strict-ssl false

# Kopiere die package.json und package-lock.json in das Arbeitsverzeichnis
COPY package*.json ./

# Installiere die Abhängigkeiten
RUN npm install

# Kopiere den restlichen App-Code in das Arbeitsverzeichnis
COPY . .

# Setze den Startbefehl für die App
CMD ["npm", "start"]

# Öffne Port 3000 im Container
EXPOSE 3000
