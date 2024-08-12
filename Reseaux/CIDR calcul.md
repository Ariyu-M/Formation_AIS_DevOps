# Calcul de Sous-Réseau :

Le calcul de sous-réseaux (subnetting) est une technique utilisée pour diviser un réseau IP en segments plus petits, appelés sous-réseaux. Cela permet une utilisation plus efficace des adresses IP et améliore la gestion du réseau.

## Concepts Clés

### 1. **Adresse IP**
- **Description :** Une adresse IP (Internet Protocol) est une étiquette numérique attribuée à chaque appareil connecté à un réseau utilisant le protocole IP pour communiquer.
- **Format :** IPv4 (32 bits, ex. : 192.168.1.1) ou IPv6 (128 bits, ex. : 2001:0db8:85a3:0000:0000:8a2e:0370:7334).

### 2. **Masque de Sous-Réseau (Subnet Mask)**
- **Description :** Le masque de sous-réseau détermine quelle partie de l'adresse IP correspond au réseau et quelle partie correspond à l'hôte.
- **Exemple :** Pour une adresse IP 192.168.1.1 avec un masque de sous-réseau de 255.255.255.0, la partie réseau est 192.168.1 et la partie hôte est .1.

### 3. **CIDR (Classless Inter-Domain Routing)**
- **Description :** Notation qui désigne l'adresse IP et la longueur du masque de sous-réseau en bits.
- **Exemple :** 192.168.1.0/24 signifie que les 24 premiers bits (192.168.1) sont la partie réseau, les 8 bits restants sont pour les hôtes.

### 4. **Adresses Spéciales**
- **Adresse Réseau :** Première adresse du sous-réseau (tous les bits d'hôtes sont à 0). Non assignable aux hôtes.
- **Adresse Diffusion (Broadcast) :** Dernière adresse du sous-réseau (tous les bits d'hôtes sont à 1). Utilisée pour envoyer des messages à tous les appareils du sous-réseau.

## Étapes du Calcul de Sous-Réseau

### 1. **Déterminer le Nombre de Sous-Réseaux Requis**
- **Formule :** 2^n ≥ nombre de sous-réseaux (où n est le nombre de bits empruntés pour le sous-réseau).
- **Exemple :** Si vous avez besoin de 4 sous-réseaux, vous empruntez 2 bits car 2^2 = 4.

### 2. **Déterminer le Nombre d'Hôtes par Sous-Réseau**
- **Formule :** 2^(nombre de bits hôte restants) - 2 ≥ nombre d'hôtes (le -2 est pour l'adresse réseau et l'adresse de diffusion).
- **Exemple :** Avec un masque /26 (ce qui laisse 6 bits pour les hôtes), vous pouvez avoir 2^6 - 2 = 62 hôtes par sous-réseau.

### 3. **Calculer le Nouveau Masque de Sous-Réseau**
- **Formule :** Additionnez les bits empruntés au masque de sous-réseau original.
- **Exemple :** Un masque /24 (255.255.255.0) devient /26 (255.255.255.192) si vous empruntez 2 bits.

### 4. **Lister les Sous-Réseaux et Plages d'Adresses**
- **Calcul :** Identifiez les adresses réseau, les plages d'adresses disponibles pour les hôtes, et les adresses de diffusion pour chaque sous-réseau.
- **Exemple :** Pour 192.168.1.0/26 :
  - Sous-réseau 1 : 192.168.1.0 - 192.168.1.63
  - Sous-réseau 2 : 192.168.1.64 - 192.168.1.127
  - Etc.

## Exemples de Calcul de Sous-Réseau

### Exemple 1 : Sous-réseau pour 192.168.1.0/24 avec 4 sous-réseaux
- **Nombre de sous-réseaux :** 4 (2 bits empruntés)
- **Nouveau masque :** /26 (255.255.255.192)
- **Sous-réseaux :**
  - 192.168.1.0/26 (192.168.1.0 - 192.168.1.63)
  - 192.168.1.64/26 (192.168.1.64 - 192.168.1.127)
  - 192.168.1.128/26 (192.168.1.128 - 192.168.1.191)
  - 192.168.1.192/26 (192.168.1.192 - 192.168.1.255)

### Exemple 2 : Sous-réseau pour 10.0.0.0/16 avec 100 hôtes par sous-réseau
- **Nombre d'hôtes :** 100 (7 bits hôte requis)
- **Nouveau masque :** /25 (255.255.255.128)
- **Sous-réseaux possibles :** 512 sous-réseaux avec 126 hôtes chacun.

## Utilité du Subnetting

- **Amélioration de l'efficacité de l'IP :** Évite le gaspillage d'adresses IP.
- **Gestion du réseau :** Facilite la gestion du trafic et l'isolement des segments de réseau.
- **Sécurité :** Permet de segmenter un réseau en zones sécurisées.

---
