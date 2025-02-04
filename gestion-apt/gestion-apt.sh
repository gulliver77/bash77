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

# Envoyer le fichier par email (remplcer <mail> par votre mail)
cat "$LOGFILE" | mail -s "Rapport de gestion APT du ${DATE}" <mail>

# Afficher un message de confirmation
echo "Les opérations sont terminées. Le rapport a été envoyé à <mail>"
