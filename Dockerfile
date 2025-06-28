FROM node:14

# Set environment variables
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production --unsafe-perm

# Copy the rest of the source code
COPY . .

# Build the application
RUN npm run build

# Expose port
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
