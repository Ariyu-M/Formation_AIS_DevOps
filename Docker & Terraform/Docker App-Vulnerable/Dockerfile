FROM debian:latest

# Définir l'utilisateur root pour les opérations nécessitant des privilèges élevés
USER root

# Mise à jour et installation des dépendances
RUN apt update && \
    apt upgrade -y && \
    apt install -y wget sudo

# Installation du SDK .NET 8.0 et du runtime
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt update && \
    apt install -y dotnet-sdk-8.0 dotnet-runtime-8.0

# Exposer les ports nécessaires pour votre application
EXPOSE 3000
EXPOSE 4000

# Copier l'application dans le conteneur
COPY VulnerableLightApp-main /app/vulnerablelightapp

# Définir le répertoire de travail
WORKDIR /app/vulnerablelightapp

# Commande par défaut pour démarrer votre application
CMD ["dotnet", "run", "--url=https://0.0.0.0:3000"]
