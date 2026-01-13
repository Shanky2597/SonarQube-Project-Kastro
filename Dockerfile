FROM eclipse-temurin:17-jdk-jammy

# Create non-root user
RUN useradd -r -u 1001 appuser

WORKDIR /app

# Copy jar with correct ownership
COPY --chown=appuser:appuser target/spotify-app-1.0.0.jar /app/spotify-app.jar

# Switch to non-root user
USER appuser

EXPOSE 5555

ENTRYPOINT ["java", "-jar", "spotify-app.jar"]


