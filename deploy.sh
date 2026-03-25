#!/bin/bash

# Script para publicar mockup.html en GitHub Pages
# Uso: ./deploy.sh

set -e

echo "🚀 Iniciando publicación a GitHub Pages..."

# Configuración
BRANCH_ACTUAL=$(git rev-parse --abbrev-ref HEAD)
OUTPUT_DIR="dist"

# Crear directorio temporal
mkdir -p $OUTPUT_DIR
cp mockup.html $OUTPUT_DIR/index.html

echo "📦 Archivos preparados en $OUTPUT_DIR/"

# Inicializar rama gh-pages si no existe
if git rev-parse --verify gh-pages > /dev/null 2>&1; then
    echo "✓ Rama gh-pages existe"
else
    echo "📝 Creando rama gh-pages..."
    git checkout --orphan gh-pages
    git rm -rf .
    git commit --allow-empty -m "Initial commit para gh-pages"
    git checkout $BRANCH_ACTUAL
fi

# Hacer checkout a gh-pages
git checkout gh-pages

# Limpiar y copiar archivos
find . -maxdepth 1 -not -name '.git' -not -name '.gitignore' -type f -delete
find . -maxdepth 1 -not -name '.git' -type d ! -path '.' -exec rm -rf {} + 2>/dev/null || true

cp $OUTPUT_DIR/index.html ./mockup.html

# Commit y push
git add mockup.html
git commit -m "Deploy: actualizar mockup.html [$(date +'%Y-%m-%d %H:%M:%S')]" || echo "Sin cambios para commitear"
git push origin gh-pages

# Volver a rama anterior
git checkout $BRANCH_ACTUAL

# Limpiar
rm -rf $OUTPUT_DIR

echo "✅ ¡Publicación completada!"
echo "📍 Tu sitio estará disponible en: https://$(git config --get remote.origin.url | sed 's/.*://; s/.git$//' | cut -d'/' -f2).github.io/unir-ai-fin-tema-5/"
echo ""
echo "💡 Nota: Asegúrate de que GitHub Pages esté habilitado en tu repositorio"
