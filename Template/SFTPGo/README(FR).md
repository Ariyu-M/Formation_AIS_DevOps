# Documentation du Fichier Docker Compose pour SFTPGo

Ce document fournit une explication détaillée de chaque variable d'environnement dans le fichier `docker-compose.yml` pour le déploiement de SFTPGo avec MySQL ainsi que le plugin d'authentification LDAP. 
Chaque variable est expliquée, et il est indiqué si elle doit être modifiée selon les besoins.

- Documentation officiel SFTPGo : [SFTPGo](https://sftpgo.github.io/latest/)

## Services

### 1. **Service SFTPGo**

Le service `sftpgo` déploie l'application SFTPGo, qui gère les connexions SFTP, HTTP, et WebDAV.

#### Ports Exposés
- **8080 :** Port pour l'interface HTTP.
- **8090 :** Port pour l'interface WebDAV.
- **2022 :** Port pour les connexions SFTP.

#### Variables d'Environnement

- **`SFTPGO_WEBDAVD__BINDINGS__0__PORT`**
  - **Description :** Spécifie le port pour l'interface WebDAV de SFTPGo.
  - **Valeur par défaut :** `8090`
  - **Modification nécessaire :** Changez cette valeur si vous devez utiliser un port différent pour WebDAV.

- **`SFTPGO_HTTPD__BINDINGS__0__PORT`**
  - **Description :** Spécifie le port pour l'interface HTTP de SFTPGo.
  - **Valeur par défaut :** `8080`
  - **Modification nécessaire :** Changez cette valeur si vous devez utiliser un port différent pour HTTP.

- **`SFTPGO_DATA_PROVIDER__DRIVER`**
  - **Description :** Type de base de données utilisé.
  - **Valeur par défaut :** `"mysql"`
  - **Modification nécessaire :** Cette valeur doit être `"mysql"` si vous utilisez MySQL comme base de données. Modifiez-la si vous utilisez un autre type de base de données compatible.

- **`SFTPGO_DATA_PROVIDER__NAME`**
  - **Description :** Nom de la base de données.
  - **Valeur par défaut :** `"sftpgo"`
  - **Modification nécessaire :** Assurez-vous que ce nom correspond à celui défini dans le service MySQL.

- **`SFTPGO_DATA_PROVIDER__HOST`**
  - **Description :** Adresse du serveur MySQL.
  - **Valeur par défaut :** `"mysql-sftpgo"`
  - **Modification nécessaire :** Modifiez cette valeur si le nom du conteneur MySQL est différent ou si le serveur MySQL est hébergé ailleurs.

- **`SFTPGO_DATA_PROVIDER__PORT`**
  - **Description :** Port de connexion au serveur MySQL.
  - **Valeur par défaut :** `3306`
  - **Modification nécessaire :** Modifiez cette valeur uniquement si vous utilisez un port différent pour MySQL.

- **`SFTPGO_DATA_PROVIDER__USERNAME`** et **`SFTPGO_DATA_PROVIDER__PASSWORD`**
  - **Description :** Identifiants pour se connecter à la base de données MySQL.
  - **Valeur par défaut :** `"SQL_USER"` et `"SQL_PASS"`
  - **Modification nécessaire :** Changez ces valeurs pour correspondre aux identifiants que vous avez définis pour l'utilisateur MySQL.

- **`SFTPGO_COMMON__DEFENDER__ENABLED`**
  - **Description :** Active la protection contre les attaques (par exemple, les tentatives de connexion échouées).
  - **Valeur par défaut :** `true`
  - **Modification nécessaire :** Modifiez cette valeur pour activer ou désactiver la protection selon vos besoins.

- **`SFTPGO_COMMON__DEFENDER__BAN_TIME`**
  - **Description :** Temps (en minutes) pendant lequel une IP est bannie après un certain nombre d'échecs de connexion.
  - **Valeur par défaut :** `10`
  - **Modification nécessaire :** Ajustez cette valeur en fonction de la politique de sécurité souhaitée.

- **`SFTPGO_COMMON__DEFENDER__BAN_TIME_INCREMENT`**
  - **Description :** Temps (en secondes) ajouté à la durée de bannissement à chaque nouvelle tentative échouée.
  - **Valeur par défaut :** `200`
  - **Modification nécessaire :** Ajustez cette valeur pour définir la durée d'extension du bannissement en fonction de vos besoins.

- **`SFTPGO_COMMON__DEFENDER__THRESHOLD`**
  - **Description :** Nombre maximal de tentatives de connexion échouées avant le bannissement.
  - **Valeur par défaut :** `8`
  - **Modification nécessaire :** Modifiez cette valeur pour ajuster le seuil de sécurité contre les tentatives de connexion non autorisées.

- **`SFTPGO_COMMON__DEFENDER__OBSERVATION_TIME`**
  - **Description :** Durée (en minutes) pendant laquelle les tentatives de connexion échouées sont comptabilisées pour le bannissement.
  - **Valeur par défaut :** `10`
  - **Modification nécessaire :** Ajustez cette valeur selon la période de temps pendant laquelle les échecs doivent être surveillés.

- **`SFTPGO_PLUGIN_AUTH_CA_CERTIFICATES`**
  - **Description :** Chemin vers les certificats CA utilisés pour valider les connexions LDAP sécurisées.
  - **Valeur par défaut :** `"/var/lib/sftpgo/certificats.crt"`
  - **Modification nécessaire :** Modifiez ce chemin si vos certificats CA sont stockés ailleurs.

- **`SFTPGO_PLUGIN_AUTH_LDAP_URL`**
  - **Description :** URL du serveur LDAP pour l'authentification.
  - **Valeur par défaut :** `"ldaps://ldap.exemple.lan:636"`
  - **Modification nécessaire :** Changez cette URL pour correspondre à celle de votre propre serveur LDAP.

- **`SFTPGO_PLUGIN_AUTH_LDAP_BASE_DN`**
  - **Description :** DN de base pour les recherches LDAP.
  - **Valeur par défaut :** `"dc=exemple,dc=lan"`
  - **Modification nécessaire :** Modifiez cette valeur pour refléter la structure de votre annuaire LDAP.

- **`SFTPGO_PLUGIN_AUTH_LDAP_BIND_DN`** et **`SFTPGO_PLUGIN_AUTH_LDAP_PASSWORD`**
  - **Description :** DN et mot de passe de l'utilisateur qui effectue les recherches LDAP.
  - **Valeur par défaut :** `"CN=nobody,OU=User,OU=Exemple,DC=lan"` et `"LDAP_PASSWORD"`
  - **Modification nécessaire :** Assurez-vous que ces informations correspondent à un utilisateur LDAP avec les droits nécessaires pour effectuer des recherches.

- **`SFTPGO_PLUGIN_AUTH_LDAP_SEARCH_QUERY`**
  - **Description :** Requête LDAP utilisée pour rechercher les utilisateurs.
  - **Valeur par défaut :** `"(&(objectClass=user)(sAMAccountType=12345678910)(sAMAccountName=%username%))"`
  - **Modification nécessaire :** Ajustez cette requête en fonction du schéma et des attributs de votre annuaire LDAP.

- **`SFTPGO_PLUGIN_AUTH_LDAP_GROUP_ATTRIBUTES`**
  - **Description :** Attributs de groupe LDAP utilisés pour l'authentification.
  - **Valeur par défaut :** `"memberOf"`
  - **Modification nécessaire :** Changez cette valeur si vos groupes LDAP utilisent un attribut différent.

- **`SFTPGO_PLUGIN_AUTH_PRIMARY_GROUP_PREFIX`**
  - **Description :** Préfixe utilisé pour les groupes LDAP principaux afin de déterminer s'ils doivent être utilisés pour l'authentification.
  - **Valeur par défaut :** `"sftpgo-"`
  - **Modification nécessaire :** Assurez-vous que ce préfixe correspond à celui utilisé pour les groupes dans LDAP que vous souhaitez utiliser pour l'authentification. Par exemple, si vos groupes LDAP d'authentification ont un préfixe différent, ajustez cette valeur.

- **`SFTPGO_PLUGIN_AUTH_REQUIRE_GROUPS`**
  - **Description :** Spécifie si l'authentification LDAP doit nécessiter que les utilisateurs appartiennent à un groupe spécifique.
  - **Valeur par défaut :** `true`
  - **Modification nécessaire :** Changez cette valeur si vous souhaitez que les utilisateurs puissent se connecter sans être membres d'un groupe spécifique.

- **`SFTPGO_PLUGIN_AUTH_CACHE_TIME`**
  - **Description :** Temps (en secondes) pendant lequel les informations d'authentification LDAP sont mises en cache.
  - **Valeur par défaut :** `60`
  - **Modification nécessaire :** Ajustez cette valeur pour optimiser la performance en fonction de la fréquence des changements dans l'annuaire LDAP.

- **`SFTPGO_PLUGINS__0__TYPE`**
  - **Description :** Type de plugin à utiliser.
  - **Valeur par défaut :** `"auth"`
  - **Modification nécessaire :** Ne changez cette valeur que si vous ajoutez des plugins de différents types.

- **`SFTPGO_PLUGINS__0__AUTH_OPTIONS__SCOPE`**
  - **Description :** Portée des options d'authentification pour le plugin.
  - **Valeur par défaut :** `5`
  - **Modification nécessaire :** Ajustez cette valeur en fonction des besoins spécifiques de votre configuration d'authentification.

- **`SFTPGO_PLUGINS__0__CMD`**
  - **Description :** Commande pour démarrer le plugin d'authentification.
  - **Valeur par défaut :** `"/usr/local/bin/sftpgo-plugin-auth"`
  - **Modification nécessaire :** Modifiez cette commande uniquement si le chemin du binaire du plugin est différent.

- **`SFTPGO_PLUGINS__0__ARGS`**
  - **Description :** Arguments à passer au plugin d'authentification.
  - **Valeur par défaut :** `"serve"`
  - **Modification nécessaire :** Changez ces arguments si vous avez besoin de paramètres spécifiques pour le plugin.

- **`SFTPGO_PLUGINS__0__AUTO_MTLS`**
  - **Description :** Active l'auto-authentification mutualisée TLS pour le plugin.
  - **Valeur par défaut :** `1` (actif)
  - **Modification nécessaire :** Modifiez cette valeur si vous souhaitez désactiver l'auto-authentification TLS.

- **`SFTPGO_SMTP__HOST`**
  - **Description :** Serveur SMTP pour l'envoi des emails.
  - **Valeur par défaut :** `"smtp.exemple.com"`
  - **Modification nécessaire :** Changez cette valeur pour correspondre à l'adresse de votre serveur SMTP.

- **`SFTPGO_SMTP__PORT`**
  - **Description :** Port du serveur SMTP.
  - **Valeur par défaut :** `25`
  - **Modification nécessaire :** Modifiez ce port si votre serveur SMTP utilise un port différent.

- **`SFTPGO_SMTP__FROM`**
  - **Description :** Adresse email de l'expéditeur pour les notifications.
  - **Valeur par défaut :** `"SFTPGo <mail@exemple.com"`
  - **Modification nécessaire :** Changez cette adresse pour qu'elle corresponde à celle que vous souhaitez utiliser comme expéditeur.

- **`SFTPGO_SMTP__USER`** et **`SFTPGO_SMTP__PASSWORD`**
  - **Description :** Identifiants pour se connecter au serveur SMTP.
  - **Valeur par défaut :** `""` (vides)
  - **Modification nécessaire :** Fournissez des identifiants si votre serveur SMTP nécessite une authentification.

- **`SFTPGO_SMTP__auth_type`**
  - **Description :** Type d'authentification SMTP (0 pour aucune, 1 pour LOGIN, 2 pour PLAIN, 3 pour CRAM-MD5).
  - **Valeur par défaut :** `0`
  - **Modification nécessaire :** Modifiez cette valeur selon les exigences de votre serveur SMTP.

- **`SFTPGO_SMTP__encryption`**
  - **Description :** Type de cryptage pour SMTP (0 pour aucun, 1 pour STARTTLS, 2 pour TLS).
  - **Valeur par défaut :** `0`
  - **Modification nécessaire :** Modifiez cette valeur selon le niveau de sécurité requis pour votre connexion SMTP.

#### Volumes
- **`sftpgo-data`**
  - **Description :** Volume pour stocker les données persistantes de SFTPGo.
  - **Modification nécessaire :** Ce volume est essentiel pour conserver les données entre les redémarrages. Ne modifiez pas cette configuration.

### 2. **Service MySQL**

Le service `mysql-sftpgo` déploie une base de données MySQL pour stocker les données de SFTPGo.

#### Variables d'Environnement
- **`MYSQL_DATABASE`**
  - **Description :** Nom de la base de données MySQL à créer.
  - **Valeur par défaut :** `"sftpgo"`
  - **Modification nécessaire :** Ce nom doit correspondre à celui utilisé par SFTPGo.

- **`MYSQL_USER`** et **`MYSQL_PASSWORD`**
  - **Description :** Identifiants pour l'utilisateur MySQL.
  - **Valeur par défaut :** `"SQL_USER"` et `"SQL_PASS"`
  - **Modification nécessaire :** Assurez-vous que ces identifiants correspondent à ceux définis dans `SFTPGO_DATA_PROVIDER__USERNAME` et `SFTPGO_DATA_PROVIDER__PASSWORD`.

- **`MYSQL_ROOT_PASSWORD`**
  - **Description :** Mot de passe pour l'utilisateur root de MySQL.
  - **Valeur par défaut :** `"SQL_ROOT_PASS"`
  - **Modification nécessaire :** Définissez un mot de passe sécurisé pour l'utilisateur root.

#### Volumes
- **`sftpgo-mysql-data`**
  - **Description :** Volume pour stocker les données persistantes de MySQL.
  - **Modification nécessaire :** Ce volume est crucial pour garantir que les données MySQL sont conservées entre les redémarrages. Ne modifiez pas cette configuration.

## Réseaux

Le réseau `default` est utilisé pour permettre la communication entre les services `sftpgo` et `mysql-sftpgo`. Le driver utilisé est `bridge`, ce qui est la configuration par défaut pour les réseaux Docker.

## Volumes

Deux volumes sont définis pour assurer la persistance des données :
- **`sftpgo-data` :** Pour les données de SFTPGo.
- **`sftpgo-mysql-data` :** Pour les données de MySQL.

Ces volumes garantissent que les données ne sont pas perdues lors d'un redémarrage ou d'une mise à jour des conteneurs.

## Conclusion

Ce template Docker Compose configure SFTPGo avec MySQL et LDAP pour l'authentification. Chaque variable d'environnement joue un rôle spécifique dans la configuration et la personnalisation des services. Assurez-vous de modifier les variables nécessaires pour adapter le déploiement à vos besoins spécifiques, en particulier celles liées à l'authentification LDAP, les identifiants de la base de données, et les paramètres SMTP.
