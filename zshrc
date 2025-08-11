# Ativa o instant prompt do Powerlevel10k se estiver disponível
# Isso deve vir antes de qualquer outra coisa, exceto comandos que exigem input do usuário
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/miniconda3/etc/profile.d/conda.sh"

# Corrige erro causado por conflito de bibliotecas do Conda com o Zsh
# Altere o caminho se sua libtinfo.so.6 estiver em outro lugar
export LD_PRELOAD=/lib/x86_64-linux-gnu/libtinfo.so.6

# Remove ativação automática do Conda
# Agora será necessário usar `conda activate` manualmente quando quiser
# (ex: `conda activate R_ds`)

# Remove caminho fixo que priorizava sempre o Conda
# Isso evitava o uso normal de comandos do sistema
# export PATH="/home/usuario/miniconda3/envs/r/bin:$PATH"  # ← Removido

# Adiciona caminho para ADB (Android Debug Bridge)
export PATH=$PATH:/path/to/adb

# Configurações de histórico de comandos
HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100
setopt SHARE_HISTORY  # Compartilha histórico entre sessões do terminal

# Inicializa sistema de autocompletar do Zsh
autoload -Uz compinit && compinit

# Adiciona o caminho para o Node.js instalado via NVM
export PATH=$PATH:/home/gabrieldadcarvalho/.nvm/versions/node/v22.14.0/bin

# Plugins do Oh My Zsh (comentar/descomentar conforme necessário)
# source ~/.oh-my-zsh/plugins/zsh-bat/zsh-bat.plugin.zsh
source ~/.oh-my-zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
source ~/.oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh

# Tema Powerlevel10k
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# Desativa instant prompt para evitar conflito com mensagens no terminal
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Arquivo de configuração visual do prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases personalizados
alias ls='exa'  # Usa exa no lugar do ls
alias obs="QT_QPA_PLATFORM=xcb obs"  # Corrige erro gráfico do OBS Studio

# Configura JAVA_HOME para Java 17
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Adiciona diretório do GAMS ao PATH
export PATH=$PATH:/opt/gams/gams49.4_linux_x64_64_sfx

# Cria aliases para o GAMS
alias gams='/opt/gams/gams49.4_linux_x64_64_sfx/gams'
alias gamslib='/opt/gams/gams49.4_linux_x64_64_sfx/gamslib'

# Plugins do Zsh (deve bater com os `source` acima)
plugins=(git conda)

# Configura editor padrão como Neovim
export EDITOR=nvim
export VISUAL=nvim

# Inicializa o NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Inicializa o zinit
source ~/.local/share/zinit/zinit.git/zinit.zsh

# Carrega o fzf-tab
zinit light Aloxaf/fzf-tab
