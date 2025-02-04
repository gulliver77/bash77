# Script de Gestion APT

Ce script bash automatise la maintenance du système Debian/Ubuntu en exécutant les commandes APT essentielles et en envoyant un rapport par email.

## Fonctionnalités

- Mise à jour de la liste des paquets (`apt update`)
- Mise à jour des paquets installés (`apt upgrade`)
- Suppression des paquets obsolètes (`apt autoremove`)
- Génération d'un rapport daté
- Envoi automatique du rapport par email

## Prérequis

- Système d'exploitation Debian/Ubuntu
- Package `mailutils` installé pour l'envoi d'emails


```bash
sudo apt install mailutils
```

## Installation

1. Clonez ou téléchargez le script `gestion-apt.sh`
2. Rendez le script exécutable :
```bash
chmod +x gestion-apt.sh
```

## Utilisation

Exécutez simplement le script :
```bash
./gestion-apt.sh
```

Le script vous demandera votre mot de passe sudo au début de l'exécution.

## Fichiers générés

Le script génère un fichier de log au format :
- Nom : `YYYY-MM-DD-gestion-apt.txt`
- Contenu : Résultats détaillés des commandes APT
- Emplacement : Dans le même répertoire que le script

## Configuration email

Par défaut, le rapport est envoyé à `admin@gulliver77.org`. Pour modifier l'adresse email, éditez la ligne correspondante dans le script.

## Maintenance

Il est recommandé d'exécuter ce script régulièrement (par exemple, une fois par semaine) pour maintenir le système à jour. Vous pouvez l'automatiser via une tâche cron.

## Licence

Ce script est distribué sous licence libre.
```

Ce README.md fournit toutes les informations nécessaires pour comprendre, installer et utiliser le script. Il inclut également des sections sur les prérequis et la maintenance, ce qui est important pour une utilisation à long terme.
