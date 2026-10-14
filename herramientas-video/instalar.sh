#!/usr/bin/env bash
# Instala herramientas gratuitas de edición de video y audio (Ubuntu/Debian).
# Uso: bash herramientas-video/instalar.sh
set -u
SUDO=""; [ "$(id -u)" -ne 0 ] && SUDO="sudo"
export DEBIAN_FRONTEND=noninteractive

echo "== Paquetes del sistema =="
$SUDO apt-get update -y
for p in ffmpeg sox libsox-fmt-all imagemagick mediainfo mkvtoolnix gifsicle webp \
         handbrake-cli melt frei0r-plugins rubberband-cli lame flac opus-tools vorbis-tools \
         espeak-ng gpac x264 x265 atomicparsley fonts-noto fonts-noto-color-emoji aria2 \
         python3-pip python3-venv; do
  $SUDO apt-get install -y --no-install-recommends "$p" \
    >/dev/null 2>&1 && echo "  ok  $p" || echo "  FALLÓ $p"
done

echo "== Paquetes de Python =="
PIPFLAGS="--break-system-packages -q"
for p in yt-dlp moviepy pydub librosa soundfile noisereduce ffmpeg-python \
         scenedetect[opencv-headless] auto-editor faster-whisper edge-tts gTTS \
         pedalboard demucs pillow audioop-lts kokoro-onnx transformers; do
  pip install $PIPFLAGS "$p" >/dev/null 2>&1 && echo "  ok  $p" || echo "  FALLÓ $p"
done

echo "== Remotion y HyperFrames (Node) =="
DIR="${ESTUDIO_DIR:-$HOME/estudio-video}"
mkdir -p "$DIR"
if [ ! -d "$DIR/remotion" ]; then
  (cd "$DIR" && npx -y create-video@latest --yes --blank remotion >/dev/null 2>&1 \
    && cd remotion && npm install >/dev/null 2>&1) \
    && echo "  ok  Remotion en $DIR/remotion" || echo "  FALLÓ Remotion"
fi
# Si hay un Chromium headless de Playwright, Remotion lo usa en vez de descargar el suyo.
HS=$(ls /opt/pw-browsers/chromium_headless_shell-*/chrome-linux/headless_shell 2>/dev/null | head -1)
if [ -n "$HS" ] && [ -f "$DIR/remotion/remotion.config.ts" ] && ! grep -q setBrowserExecutable "$DIR/remotion/remotion.config.ts"; then
  echo "Config.setBrowserExecutable(\"$HS\");" >> "$DIR/remotion/remotion.config.ts"
fi
npm install -g hyperframes >/dev/null 2>&1 && echo "  ok  hyperframes CLI" || echo "  FALLÓ hyperframes CLI"
hyperframes browser ensure >/dev/null 2>&1 && echo "  ok  navegador de HyperFrames" || echo "  FALLÓ navegador de HyperFrames"
(cd "$DIR" && npx -y skills add heygen-com/hyperframes -y >/dev/null 2>&1) \
  && echo "  ok  skills de HyperFrames" || echo "  FALLÓ skills de HyperFrames"
(cd "$DIR" && npx -y skills add remotion-dev/skills -y >/dev/null 2>&1) \
  && echo "  ok  skills de Remotion" || echo "  FALLÓ skills de Remotion"
echo "Listo. Proyectos en $DIR"
