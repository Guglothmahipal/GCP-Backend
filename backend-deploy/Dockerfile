# 1) Build stage
FROM node:18-alpine AS build

WORKDIR /app

# copy package files first (better caching)
COPY package*.json ./
RUN npm ci

# copy source and build
COPY . .
RUN npm run build

# 2) Production stage
FROM node:18-alpine

WORKDIR /app

# Copy built files and package.json for prod install
COPY --from=build /app/dist ./dist
COPY package*.json ./

# Install only production deps
RUN npm ci --omit=dev

# Expose port used by the app
EXPOSE 7070

# Use a non-root user (optional but good practice)
# RUN addgroup -S app && adduser -S app -G app
# USER app

# Start the app
CMD ["node", "dist/server.js"]
