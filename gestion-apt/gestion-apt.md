Sript 'gestion-aptsh'


```
shell:bash/gestion-apt.sh
#!/bin/bash

# Obtenir la date pour le nom du fichier
DATE=$(date +%Y-%m-%d)
LOGFILE="${DATE}-gestion-apt.txt"

# Demander le mot de passe sudo une seule fois
sudo -v

# Rediriger toutes les sorties vers le fichier log
{
    echo "=== Rapport de mise à jour système du ${DATE} ==="
    echo ""
    
    echo "=== Exécution de apt update ==="
    sudo apt update -y
    
    echo ""
    echo "=== Exécution de apt upgrade ==="
    sudo apt upgrade -y
    
    echo ""
    echo "=== Exécution de apt autoremove ==="
    sudo apt autoremove -y
    
    echo ""
    echo "=== Fin du rapport ==="
} > "$LOGFILE" 2>&1

# Envoyer le fichier par email
cat "$LOGFILE" | mail -s "Rapport de gestion APT du ${DATE}" admin@gulliver77.org

# Afficher un message de confirmation
echo "Les opérations sont terminées. Le rapport a été envoyé à admin@gulliver77.org"

```


Voici les explications du script :

1. Le script commence par créer un nom de fichier avec la date du jour au format YYYY-MM-DD
2. La commande `sudo -v` demande le mot de passe sudo une seule fois au début
3. Toutes les commandes sont exécutées avec le flag `-y` pour répondre automatiquement "yes"
4. Les sorties sont redirigées vers le fichier log (`2>&1` capture aussi les erreurs)
5. Le fichier est envoyé par email avec la commande `mail`
6. Un message de confirmation est affiché à la fin

Pour utiliser ce script :

1. Rendez-le exécutable avec : `chmod +x gestion-apt.sh`    
2. Assurez-vous que le paquet `mailutils` est installé pour l'envoi d'emails
3. Exécutez-le avec : `./gestion-apt.sh`

Le script créera un fichier de log daté et l'enverra automatiquement par email à l'adresse spécifiée.
