# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.
#
#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
FROM kalilinux/kali-rolling:latest


# ----------------------------------------------------------------------------
# ENV: variables de entorno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
#   DEBIAN_FRONTEND=noninteractive  → apt no hace preguntas interactivas
#   LANG / LC_ALL=es_ES.UTF-8       → idioma y codificación de caracteres
#   TERM=xterm-256color             → 256 colores en la terminal
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# ----------------------------------------------------------------------------
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# ----------------------------------------------------------------------------
# RUN: instalar todo el software del curso en una sola capa
# ----------------------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shell ===
    neovim \
    vim \
    bash \
    bash-completion \
    \
    # === Herramientas de 4ta generación (protagonistas Unidades 2-4) ===
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual ===
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes ===
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP legible ===
    httpie \
    \
 # --- Activar idioma español ---
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final ---
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: usar bash para los siguientes RUN
# ----------------------------------------------------------------------------
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
WORKDIR /workspaces

RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system


# ----------------------------------------------------------------------------
# Prompt institucional para bash
# ----------------------------------------------------------------------------
RUN cat >> /root/.bashrc <<'EOF'

# ===== Prompt del curso Black Hat Bash (Caps. 1-2) =====
# \u = usuario, \W = directorio actual, $? = exit code del último comando
PS1='\[\e[0;36m\][Ariel-Guerrero]\[\e[0m\] \[\e[0;33m\]\W\[\e[0m\] $(if [ $? -eq 0 ]; then echo "\[\e[0;32m\]✓"; else echo "\[\e[0;31m\]✗ $?"; fi)\[\e[0m\] \$ '
EOF

# ----------------------------------------------------------------------------
# CMD: bash interactivo por defecto
# ----------------------------------------------------------------------------
CMD ["/bin/bash"]