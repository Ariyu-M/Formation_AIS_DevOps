# Docker Compose File Documentation for SFTPGo

This document provides a detailed explanation of each environment variable in the docker-compose.yml file for deploying SFTPGo with MySQL and the LDAP authentication plugin. Each variable is explained, and it is indicated whether it needs to be modified as per requirements.

Official SFTPGo Documentation: [SFTPGo](https://sftpgo.github.io/latest/)

## Services

### 1. **SFTPGo Service**

The `sftpgo` service deploys the SFTPGo application, which manages SFTP, HTTP, and WebDAV connections.

#### Exposed Ports
- **8080 :** Port for the HTTP interface.
- **8090 :** Port for the WebDAV interface.
- **2022 :** Port for SFTP connections.

#### Environment Variables

- **`SFTPGO_WEBDAVD__BINDINGS__0__PORT`**
  - **Description:** Specifies the port for the SFTPGo WebDAV interface.
  - **Default Value:** `8090`
  - **Modification Required:** Change this value if you need to use a different port for WebDAV.

- **`SFTPGO_HTTPD__BINDINGS__0__PORT`**
  - **Description:** Specifies the port for the SFTPGo HTTP interface.
  - **Default Value:** `8080`
  - **Modification Required:** Change this value if you need to use a different port for HTTP.

- **`SFTPGO_DATA_PROVIDER__DRIVER`**
  - **Description:** Type of database used.
  - **Default Value:** `"mysql"`
  - **Modification Required:** This value should be `"mysql"` if you are using MySQL as your database. Change it if you are using another compatible database type.

- **`SFTPGO_DATA_PROVIDER__NAME`**
  - **Description:** Database name.
  - **Default Value:** `"sftpgo"`
  - **Modification Required:** Ensure this name matches the one defined in the MySQL service.

- **`SFTPGO_DATA_PROVIDER__HOST`**
  - **Description:** Address of the MySQL server.
  - **Default Value:** `"mysql-sftpgo"`
  - **Modification Required:** Modify this value if the MySQL container name is different or if the MySQL server is hosted elsewhere.

- **`SFTPGO_DATA_PROVIDER__PORT`**
  - **Description:** Port to connect to the MySQL server.
  - **Default Value:** `3306`
  - **Modification Required:** Modify this value only if you are using a different port for MySQL.

- **`SFTPGO_DATA_PROVIDER__USERNAME`** and **`SFTPGO_DATA_PROVIDER__PASSWORD`**
  - **Description:** Credentials to connect to the MySQL database.
  - **Default Value:** `"SQL_USER"` and `"SQL_PASS"`
  - **Modification Required:** Change these values to match the credentials you have set for the MySQL user.

- **`SFTPGO_COMMON__DEFENDER__ENABLED`**
  - **Description:** Enables protection against attacks (e.g., failed login attempts).
  - **Default Value:** `true`
  - **Modification Required:** Modify this value to enable or disable protection according to your needs.

- **`SFTPGO_COMMON__DEFENDER__BAN_TIME`**
  - **Description:** Time (in minutes) that an IP is banned after a certain number of failed login attempts.
  - **Default Value:** `10`
  - **Modification Required:** Adjust this value based on your desired security policy.

- **`SFTPGO_COMMON__DEFENDER__BAN_TIME_INCREMENT`**
  - **Description:** Time (in seconds) added to the ban duration with each new failed attempt.
  - **Default Value:** `200`
  - **Modification Required:** Adjust this value to set the duration of ban extension based on your needs.

- **`SFTPGO_COMMON__DEFENDER__THRESHOLD`**
  - **Description:** Maximum number of failed login attempts before banning.
  - **Default Value:** `8`
  - **Modification Required:** Modify this value to adjust the security threshold against unauthorized login attempts.

- **`SFTPGO_COMMON__DEFENDER__OBSERVATION_TIME`**
  - **Description:** Duration (in minutes) during which failed login attempts are counted for banning.
  - **Default Value:** `10`
  - **Modification Required:** Adjust this value based on the period during which failures should be monitored.

- **`SFTPGO_PLUGIN_AUTH_CA_CERTIFICATES`**
  - **Description:** Path to the CA certificates used to validate secure LDAP connections.
  - **Default Value:** `"/var/lib/sftpgo/certificats.crt"`
  - **Modification Required:** Modify this path if your CA certificates are stored elsewhere.

- **`SFTPGO_PLUGIN_AUTH_LDAP_URL`**
  - **Description:** URL of the LDAP server for authentication.
  - **Default Value:** `"ldaps://ldap.example.lan:636"`
  - **Modification Required:** Change this URL to match your LDAP server's URL.

- **`SFTPGO_PLUGIN_AUTH_LDAP_BASE_DN`**
  - **Description:** Base DN for LDAP searches.
  - **Default Value:** `"dc=example,dc=lan"`
  - **Modification Required:** Modify this value to reflect your LDAP directory structure.

- **`SFTPGO_PLUGIN_AUTH_LDAP_BIND_DN`** and **`SFTPGO_PLUGIN_AUTH_LDAP_PASSWORD`**
  - **Description:** DN and password of the user performing LDAP searches.
  - **Default Value:** `"CN=nobody,OU=User,OU=Example,DC=lan"` and `"LDAP_PASSWORD"`
  - **Modification Required:** Ensure these credentials match an LDAP user with the necessary rights to perform searches.

- **`SFTPGO_PLUGIN_AUTH_LDAP_SEARCH_QUERY`**
  - **Description:** LDAP query used to search for users.
  - **Default Value:** `"(&(objectClass=user)(sAMAccountType=12345678910)(sAMAccountName=%username%))"`
  - **Modification Required:** Adjust this query according to your LDAP directory schema and attributes.

- **`SFTPGO_PLUGIN_AUTH_LDAP_GROUP_ATTRIBUTES`**
  - **Description:** LDAP group attributes used for authentication.
  - **Default Value:** `"memberOf"`
  - **Modification Required:** Change this value if your LDAP groups use a different attribute.

- **`SFTPGO_PLUGIN_AUTH_PRIMARY_GROUP_PREFIX`**
  - **Description:** Prefix used for primary LDAP groups to determine if they should be used for authentication.
  - **Default Value:** `"sftpgo-"`
  - **Modification Required:** Ensure this prefix matches the one used for LDAP groups you want to use for authentication. For example, if your LDAP authentication groups have a different prefix, adjust this value.

- **`SFTPGO_PLUGIN_AUTH_REQUIRE_GROUPS`**
  - **Description:** Specifies whether LDAP authentication requires users to be part of a specific group.
  - **Default Value:** `true`
  - **Modification Required:** Change this value if you want users to be able to log in without being members of a specific group.

- **`SFTPGO_PLUGIN_AUTH_CACHE_TIME`**
  - **Description:** Time (in seconds) that LDAP authentication information is cached.
  - **Default Value:** `60`
  - **Modification Required:** Adjust this value to optimize performance based on how frequently changes occur in the LDAP directory.

- **`SFTPGO_PLUGINS__0__TYPE`**
  - **Description:** Type of plugin to use.
  - **Default Value:** `"auth"`
  - **Modification Required:** Change this value only if you are adding plugins of different types.

- **`SFTPGO_PLUGINS__0__AUTH_OPTIONS__SCOPE`**
  - **Description:** Scope of authentication options for the plugin.
  - **Default Value:** `5`
  - **Modification Required:** Adjust this value based on the specific needs of your authentication configuration.

- **`SFTPGO_PLUGINS__0__CMD`**
  - **Description:** Command to start the authentication plugin.
  - **Default Value:** `"/usr/local/bin/sftpgo-plugin-auth"`
  - **Modification Required:** Modify this command only if the plugin binary path is different.

- **`SFTPGO_PLUGINS__0__ARGS`**
  - **Description:** Arguments to pass to the authentication plugin.
  - **Default Value:** `"serve"`
  - **Modification Required:** Change these arguments if you need specific parameters for the plugin.

- **`SFTPGO_PLUGINS__0__AUTO_MTLS`**
  - **Description:** Enables mutual TLS auto-authentication for the plugin.
  - **Default Value:** `1` (enabled)
  - **Modification Required:** Modify this value if you want to disable mutual TLS auto-authentication.

- **`SFTPGO_SMTP__HOST`**
  - **Description:** SMTP server for sending emails.
  - **Default Value:** `"smtp.example.com"`
  - **Modification Required:** Change this value to match your SMTP server's address.

- **`SFTPGO_SMTP__PORT`**
  - **Description:** SMTP server port.
  - **Default Value:** `25`
  - **Modification Required:** Modify this port if your SMTP server uses a different port.

- **`SFTPGO_SMTP__FROM`**
  - **Description:** Sender email address for notifications.
  - **Default Value:** `"SFTPGo <mail@example.com"`
  - **Modification Required:** Change this address to the one you want to use as the sender.

- **`SFTPGO_SMTP__USER`** and **`SFTPGO_SMTP__PASSWORD`**
  - **Description:** Credentials to connect to the SMTP server.
  - **Default Value:** `""` (empty)
  - **Modification Required:** Provide credentials if your SMTP server requires authentication.

- **`SFTPGO_SMTP__auth_type`**
  - **Description:** SMTP authentication type (0 for none, 1 for LOGIN, 2 for PLAIN, 3 for CRAM-MD5).
  - **Default Value:** `0`
  - **Modification Required:** Modify this value according to your SMTP server's requirements.

- **`SFTPGO_SMTP__encryption`**
  - **Description:** Encryption type for SMTP (0 for none, 1 for STARTTLS, 2 for TLS).
  - **Default Value:** `0`
  - **Modification Required:** Modify this value according to the level of security required for your SMTP connection.

#### Volumes
- **`sftpgo-data`**
  - **Description:** Volume for storing persistent SFTPGo data.
  - **Modification Required:** This volume is essential to keep data between restarts. Do not modify this configuration.

### 2. **MySQL Service**

The `mysql-sftpgo` service deploys a MySQL database to store SFTPGo data.

#### Environment Variables
- **`MYSQL_DATABASE`**
  - **Description:** Name of the MySQL database to create.
  - **Default Value:** `"sftpgo"`
  - **Modification Required:** This name must match the one used by SFTPGo.

- **`MYSQL_USER`** and **`MYSQL_PASSWORD`**
  - **Description:** Credentials for the MySQL user.
  - **Default Value:** `"SQL_USER"` and `"SQL_PASS"`
  - **Modification Required:** Ensure these credentials match those defined in `SFTPGO_DATA_PROVIDER__USERNAME` and `SFTPGO_DATA_PROVIDER__PASSWORD`.

- **`MYSQL_ROOT_PASSWORD`**
  - **Description:** Password for the MySQL root user.
  - **Default Value:** `"SQL_ROOT_PASS"`
  - **Modification Required:** Set a secure password for the root user.

#### Volumes
- **`sftpgo-mysql-data`**
  - **Description:** Volume for storing persistent MySQL data.
  - **Modification Required:** This volume is crucial to ensure that MySQL data is preserved between restarts. Do not modify this configuration.

## Networks

The `default` network is used to allow communication between the `sftpgo` and `mysql-sftpgo` services. The driver used is `bridge`, which is the default configuration for Docker networks.

## Volumes

Two volumes are defined to ensure data persistence:
- **`sftpgo-data` :** For SFTPGo data.
- **`sftpgo-mysql-data` :** For MySQL data.

These volumes ensure that data is not lost during container restarts or updates.

## Conclusion

This Docker Compose template configures SFTPGo with MySQL and LDAP for authentication. Each environment variable plays a specific role in configuring and customizing the services. Make sure to modify the necessary variables to adapt the deployment to your specific needs, especially those related to LDAP authentication, database credentials, and SMTP settings.
