# Guía de despliegue a GitHub Pages

Pasos para publicar este sitio en `https://estefano2344.github.io/politutorias-prompts/`.

## 1. Crear el repositorio en GitHub

1. Abrir https://github.com/new (con sesión iniciada en la cuenta **Estefano2344**)
2. Configurar:
   - **Repository name:** `politutorias-prompts`
   - **Description:** `Compendio de prompts de IA Generativa del componente DevOps del TIC de Politutorías`
   - **Visibility:** Public (necesario para GitHub Pages gratuito)
   - **NO marcar** "Add a README file"
   - **NO marcar** "Add .gitignore"
   - **NO marcar** "Choose a license"
3. Clic en **Create repository**

## 2. Hacer push del contenido local

Abrir PowerShell o CMD en la carpeta `D:\Tesis\politutorias-prompts\` y ejecutar:

```powershell
cd D:\Tesis\politutorias-prompts

git init
git add .
git commit -m "Initial commit: 172 prompts en 4 secciones"
git branch -M main
git remote add origin https://github.com/Estefano2344/politutorias-prompts.git
git push -u origin main
```

Si Git pide credenciales, usar tu usuario `Estefano2344` y un Personal Access Token (no la contraseña). Para crear el token: https://github.com/settings/tokens/new — marcar solo el scope `repo` y copiar el valor que aparece.

## 3. Activar GitHub Pages

1. Ir a `https://github.com/Estefano2344/politutorias-prompts/settings/pages`
2. En **Source**, seleccionar **Deploy from a branch**
3. En **Branch**, seleccionar `main` y carpeta `/ (root)`
4. Clic en **Save**

El sitio se publica en 2-5 minutos en: **https://estefano2344.github.io/politutorias-prompts/**

## 4. Verificación

Al cargar el sitio deberías ver:

- Página de inicio con el título y la tabla de las 4 secciones
- Buscador en la parte superior
- Navegación lateral con las 4 secciones y sus prompts individuales
- Tema oscuro de `just-the-docs`

## Resolución de problemas comunes

**El sitio aparece en blanco**: esperar 5 minutos más. El primer build puede tardar.

**Error 404**: verificar que el `baseurl` en `_config.yml` coincida con el nombre exacto del repo (case-sensitive).

**No se ve el tema correctamente**: verificar que GitHub Pages esté configurado con la rama `main` y carpeta raíz, no `gh-pages`.

**No funciona el buscador**: el buscador se construye con el primer build de Jekyll. Refrescar la página después de unos minutos.

## Actualizar el sitio

Cuando agregues más prompts o secciones:

```powershell
cd D:\Tesis\politutorias-prompts
git add .
git commit -m "Agregar prompts de [seccion]"
git push
```

GitHub Pages re-construye automáticamente en 1-2 minutos.
