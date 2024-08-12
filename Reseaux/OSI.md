# Modèle OSI : 

Le modèle OSI (Open Systems Interconnection) est un cadre conceptuel qui divise les fonctions de communication d'un réseau en 7 couches distinctes. Chaque couche a un rôle spécifique dans la transmission des données d'un point A à un point B.

## 1. Couche Physique (Physical Layer)

- **Fonction principale :** Transmission brute des données sous forme de signaux électriques ou optiques.
- **Rôle :** Gère les aspects matériels, comme les câbles, les connecteurs, les tensions électriques, les débits de données.
- **Exemples :** Ethernet (câble RJ45), USB, DSL.

## 2. Couche Liaison de Données (Data Link Layer)

- **Fonction principale :** Fournir un transfert de données fiable entre deux nœuds adjacents.
- **Rôle :** Gère la détection et la correction des erreurs physiques, le contrôle de flux, l'adressage physique (MAC).
- **Exemples :** Protocole Ethernet, Switches, Adresses MAC.

## 3. Couche Réseau (Network Layer)

- **Fonction principale :** Détermination du chemin (routage) pour envoyer des paquets de données à travers le réseau.
- **Rôle :** Gère l'adressage logique, le routage, et la gestion des paquets entre les réseaux différents.
- **Exemples :** IP (Internet Protocol), Routeurs, Adresses IP.

## 4. Couche Transport (Transport Layer)

- **Fonction principale :** Assurer un transfert de données fiable de bout en bout.
- **Rôle :** Segmentation des données, contrôle de flux, gestion des connexions, détection et correction des erreurs.
- **Exemples :** TCP (Transmission Control Protocol), UDP (User Datagram Protocol).

## 5. Couche Session (Session Layer)

- **Fonction principale :** Gestion des sessions de communication entre deux dispositifs.
- **Rôle :** Etablir, maintenir, et terminer des sessions entre applications. Gère la synchronisation et la reprise des échanges.
- **Exemples :** Protocoles RPC (Remote Procedure Call), NetBIOS.

## 6. Couche Présentation (Presentation Layer)

- **Fonction principale :** Traduction des données entre le format de l'application et le format réseau.
- **Rôle :** Gère la compression, le chiffrement, et la conversion des formats de données pour assurer une communication correcte.
- **Exemples :** SSL/TLS (chiffrement), JPEG, MPEG, ASCII, EBCDIC.

## 7. Couche Application (Application Layer)

- **Fonction principale :** Interface directe avec l'utilisateur final ou les applications.
- **Rôle :** Gère les protocoles de communication pour les applications réseau, comme la messagerie électronique, le transfert de fichiers, et la navigation Web.
- **Exemples :** HTTP, FTP, SMTP, DNS, Telnet.

---