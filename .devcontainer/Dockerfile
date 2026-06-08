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


 # f) We use sed, a stream editor (BHB Ch. 2), to search and uncomment the 
 # Spanish locale line inside the locale.gen file. Then locale-gen compiles it.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # g) We run apt-get clean and remove the downloaded package lists to free up space. 
 # This cleanup MUST happen in the exact same RUN instruction. If we cleaned up 
 # in a separate RUN, the cached files would remain permanently baked into the 
 # previous Docker layer, defeating the purpose of deleting them.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# h) Docker uses /bin/sh by default. We explicitly switch the default shell 
# to /bin/bash because it provides more advanced features for later RUN steps 
# (e.g., arrays, double bracket conditions) as outlined in BHB Ch. 1.
SHELL ["/bin/bash", "-c"]

# i) WORKDIR sets the default working directory for any subsequent instructions 
# and determines where the user will be placed when they first enter the container.
WORKDIR /workspaces

# j) These commands configure global Git settings for the container:
# - 'safe.directory *' prevents permission errors when accessing mounted repos.
# - 'init.defaultBranch main' sets the default branch name for new repositories.
# - 'pull.rebase false' sets the default pull behavior to merge.
# - 'git lfs install' enables Large File Storage tracking globally.
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