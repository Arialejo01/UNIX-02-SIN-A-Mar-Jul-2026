# ============================================================================
# Dockerfile
# ============================================================================
# b) A Dockerfile is essentially a recipe that builds an image layer by layer. 
# As explained in BHB Ch. 3, an image acts as a read-only blueprint, while a 
# container is the live, running instance of that blueprint. Every instruction 
# (RUN, ENV, etc.) creates a cached layer. Instruction order is critical: 
# placing frequently changed commands at the top will invalidate the cache 
# for all subsequent layers, significantly slowing down the build time.
# ============================================================================

# a) The FROM instruction specifies the base image we are building upon. 
# We use Kali Linux rolling because it is an environment specifically tailored 
# for penetration testing, meaning many of the tools discussed in BHB Ch. 3 
# are natively supported or pre-installed.
FROM kalilinux/kali-rolling:latest


# c) Environment variables define global system settings accessible by any shell 
# process (BHB Ch. 1). 
# DEBIAN_FRONTEND=noninteractive prevents apt-get from halting the automated build 
# to ask for user input. 
# LANG and LC_ALL configure the system's locale to support Spanish characters (UTF-8).
# TERM tells terminal applications that the console supports 256 colors.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color

# d) Here we use the pipe operator (|) to redirect the standard output of the echo 
# command into debconf-set-selections (BHB Ch. 1). This pre-answers Wireshark's 
# interactive prompt about allowing non-root users to capture packets, preventing 
# the automated build from freezing.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# e) We execute one massive RUN block to install all software. 
# 'apt-get update' refreshes the list of available packages, while 'install' 
# downloads them. We use '-y' to automatically approve prompts and 
# '--no-install-recommends' to avoid downloading unnecessary dependencies, saving space.
# 
# We use the logical AND operator (&&) to chain commands (BHB Ch. 1) ensuring 
# the build stops immediately if any command fails. The trailing backslash (\) 
# allows us to split a single command across multiple lines for readability.
# We consolidate this into ONE big RUN instruction to minimize the number of 
# layers created, which keeps the final image lightweight (BHB Ch. 3).
#
# Key tools installed:
# - sed, grep, awk: Core text processing utilities (BHB Ch. 2).
# - shellcheck: A linter to analyze bash scripts for errors.
# - nmap, tcpdump/tshark: Tools for network scanning and packet capture.
# - tor/proxychains4: Utilities to anonymize traffic and bypass restrictions.
# - jq: A command-line processor for JSON data.
# - man-db: Provides manual pages for offline command documentation.
RUN apt-get update && apt-get install -y --no-install-recommends \
    neovim vim zsh bash-completion \
    perl make gawk sed grep \
    coreutils findutils procps less tree jq \
    man-db manpages manpages-posix \
    curl wget git git-lfs ca-certificates locales \
    shellcheck \
    nmap masscan \
    tcpdump tshark \
    netcat-traditional socat dnsutils whois traceroute mtr-tiny iproute2 net-tools iputils-ping \
    tor torsocks proxychains4 obfs4proxy \
    httpie \

    
 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.
# Prompt del curso para bash

# Cambiar shell de login de root a zsh dentro de la imagen,
# para que chsh ya no haga falta y todo sea consistente.
RUN chsh -s /usr/bin/zsh root

# Prompt institucional para los y las estudiantes del curso
RUN cat >> /root/.zshrc <<'EOF'

# ===== Valida si un comando fue ejecutado correctamente =====
PROMPT='%F{cyan}[Ariel-Guerrero]%f %F{yellow}%1~%f %(?.%F{green}✓.%F{red}✗ %?)%f %# '
EOF

CMD ["/usr/bin/zsh"]