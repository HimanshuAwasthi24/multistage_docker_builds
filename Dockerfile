#nodejs multistage docker file example

FROM node:10.17.0 AS build-env
ADD . /app
WORKDIR /app
RUN npm ci --only=production

# Copy application with its dependencies into distroless image
FROM gcr.io/distroless/nodejs
COPY --from=build-env /app /app
WORKDIR /app
CMD ["server.js"]