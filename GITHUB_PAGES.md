# 📖 Guía de Publicación en GitHub Pages

## Opción 1: Script Bash (Manual)

### Requisitos previos:
1. Tener repositorio configurado en GitHub
2. Asegúrate de que tienes permisos de push

### Uso:

```bash
# Hacer el script ejecutable
chmod +x deploy.sh

# Ejecutar el script
./deploy.sh
```

El script:
- ✓ Prepara los archivos en una carpeta temporal
- ✓ Crea la rama `gh-pages` si no existe
- ✓ Copia `mockup.html` como `index.html` en gh-pages
- ✓ Hace commit y push automáticamente
- ✓ Regresa a tu rama anterior

---

## Opción 2: GitHub Actions (Automático) ⭐ Recomendado

El workflow en `.github/workflows/deploy.yml` se ejecuta automáticamente cuando:
- Haces `push` a `main` o `master`
- Ejecutas manualmente desde la pestaña "Actions"

### Pasos:

1. Haz `push` de estos archivos al repositorio
2. Ve a tu repositorio en GitHub
3. Ve a Settings → Pages
4. En "Source", selecciona rama `gh-pages` y carpeta `/ (root)`
5. ¡Listo! El despliegue será automático en cada push

---

## Configurar GitHub Pages

1. Ve a tu repositorio en GitHub
2. Settings → Pages
3. Selecciona:
   - Source: Deploy from a branch
   - Branch: `gh-pages`
   - Carpeta: `/ (root)`
4. Guarda cambios

Tu sitio estará disponible en:
```
https://[tu-usuario].github.io/unir-ai-fin-tema-5/
```

---

## Solución de problemas

**El sitio no aparece después de publicar:**
- Espera 1-2 minutos para que GitHub procese el cambio
- Verifica que la rama `gh-pages` exista en tu repositorio
- Revisa la configuración en Settings → Pages

**El mockup.html tiene rutas relativas rotas:**
- Asegúrate de que todas las URLs sean relativas (sin `/`)
- Los archivos CSS/JS externos con CDN funcionarán correctamente
