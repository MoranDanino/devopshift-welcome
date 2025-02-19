# === STAGE 1: BUILD ===
FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
RUN echo "✅ BUILD FINISHED"


# === STAGE 2: UNIT TESTS ===
FROM node:alpine AS tester
WORKDIR /app
COPY --from=builder /app/package*.json .  
COPY --from=builder /app/node_modules ./node_modules  
COPY --from=builder /app/server.test.js .  
COPY --from=builder /app/server.js . 
RUN npm test
RUN echo "🧪 Running Pytest"
RUN echo "✅ TESTS FINISHED"


# === STAGE 3: FINAL IMAGE ===
FROM node:alpine-slim AS production
WORKDIR /app
COPY --from=tester /app/server.js .
CMD ["node", "server.js"]