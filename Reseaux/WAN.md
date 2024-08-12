# Topologies Répandues dans les WAN

1. **Topologie en étoile** : Un site central est connecté à plusieurs sites périphériques.
2. **Topologie maillée** : Chaque site est connecté à plusieurs autres sites, offrant de multiples chemins de communication.
3. **Topologie en anneau** : Les sites sont connectés en boucle, assurant la redondance.
4. **Topologie point-à-point** : Connexion directe entre deux sites spécifiques.

# Performances, Latence, Redondance, Sécurité, Bande Passante

1. **Performances** : Efficacité de la transmission de données dans le réseau.
2. **Latence** : Temps de réponse entre l'émission et la réception des données.
3. **Redondance** : Présence de chemins alternatifs pour garantir la continuité du service en cas de panne.
4. **Sécurité** : Protection des données contre les accès non autorisés et les attaques.
5. **Bande Passante** : Capacité maximale de transmission de données à travers le réseau.

# Technologies d'Accès au WAN

### WAN Publics

1. **FTTH/FTTE** : Fibre optique jusqu'au domicile/entreprise, offrant une haute bande passante.
2. **DSL** : Utilisation des lignes téléphoniques pour la transmission de données à haute vitesse.
3. **PPP** : Protocole point-à-point pour la connexion directe entre deux points réseau.
4. **DOCSIS** : Norme pour la transmission de données sur les réseaux câblés.

### WAN Privés

1. **Lignes Louées** : Connexions dédiées entre sites pour une transmission sécurisée et fiable.
2. **Metro Ethernet** : Extension des réseaux Ethernet aux zones métropolitaines.
3. **MPLS** : Protocole pour diriger les données à travers des chemins prédéfinis dans un réseau.
4. **VPN** : Réseau privé virtuel pour une connexion sécurisée via Internet.
5. **RNIS** : Réseau numérique à intégration de services pour la transmission de voix et données.
6. **RTPC** : Réseau téléphonique public commuté.
7. **Frame Relay** : Technologie de commutation de paquets pour les réseaux WAN.
8. **ATM** : Mode de transfert asynchrone pour la transmission de voix et données.

# Interconnexion de Secours

1. **Mono FAI** : Utilisation d'un seul fournisseur d'accès à Internet avec des lignes redondantes.
2. **Multi FAI** : Connexion via plusieurs fournisseurs d'accès à Internet pour assurer la continuité de service en cas de panne.

# SD-WAN

- **SD-WAN** : Technologie de réseau définie par logiciel permettant de gérer et optimiser les connexions WAN en utilisant des logiciels pour contrôler la connectivité et les services réseau.

# Protocoles de Routage

### Rôles : Redondance, Équilibrage de Charge, Multiplicité des Chemins

1. **Redondance** : Assurer plusieurs chemins pour la transmission des données en cas de panne.
2. **Équilibrage de Charge** : Répartir le trafic de manière équilibrée sur plusieurs chemins.
3. **Multiplicité des Chemins** : Offrir plusieurs routes pour atteindre un même réseau.

### Détection de Panne et Basculement

1. **État de Liens** : Surveillance des connexions pour détecter les pannes.
2. **Mécanismes de Timers** : Utilisation de temporisateurs pour la détection rapide des pannes.
3. **Basculement Automatique** : Redirection automatique du trafic en cas de défaillance d'un chemin.

### Protocoles de Routage Utilisés dans les WAN

1. **OSPF** : Open Shortest Path First.
2. **BGP** : Border Gateway Protocol.
3. **EIGRP** : Enhanced Interior Gateway Routing Protocol.
4. **RIP** : Routing Information Protocol.