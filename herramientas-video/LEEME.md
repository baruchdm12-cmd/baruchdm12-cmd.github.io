# Herramientas de video y audio (gratis)

Para instalar todo, ejecuta: `bash herramientas-video/instalar.sh`

| Herramienta | Para qué sirve |
|---|---|
| FFmpeg | Cortar, unir, convertir, comprimir, subtítulos, velocidad |
| Remotion | Videos hechos con código (React): animaciones, plantillas |
| HyperFrames | Videos con HTML/GSAP (de HeyGen), CLI `hyperframes` |
| yt-dlp | Descargar videos y audio de YouTube, TikTok, Instagram, etc. |
| SoX, rubberband | Editar audio: cortar, normalizar, efectos, cambiar tono/velocidad |
| MoviePy, ffmpeg-python | Editar video desde Python |
| pydub, librosa, pedalboard, noisereduce | Audio en Python: efectos, análisis, quitar ruido |
| demucs | Separar voz, música, batería y bajo |
| faster-whisper | Transcribir audio y hacer subtítulos automáticos |
| edge-tts, gTTS, espeak-ng | Texto a voz |
| auto-editor | Quitar silencios automáticamente |
| PySceneDetect | Detectar cortes de escena |
| ImageMagick, gifsicle, webp | Imágenes, miniaturas y GIFs |
| HandBrake CLI, MKVToolNix, MediaInfo, GPAC (MP4Box) | Comprimir, contenedores e información técnica |
| MLT (melt) + frei0r | Motor de edición por línea de comandos (el que usa Kdenlive) |
| lame, flac, opus-tools, vorbis-tools | Codificar audio en MP3, FLAC, Opus y OGG |

Remotion queda en `~/estudio-video/remotion` y las skills de Remotion y HyperFrames en `~/estudio-video/.claude/skills`.

Si un CDN como jsdelivr está bloqueado en tu red, HyperFrames no puede cargar GSAP. En ese caso instálalo con
`npm i gsap` dentro del proyecto y cambia el `<script src>` para que apunte a la copia local.
