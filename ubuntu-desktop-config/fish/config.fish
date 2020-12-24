# Default terminal editor
set -U EDITOR nvim

# Fzf options
set -x FZF_DEFAULT_OPTS '
  --preview "bat {-1} -f"
  --color fg:255,bg:236,hl:84,fg+:255,bg+:236,hl+:215
  --color info:141,prompt:84,spinner:212,pointer:212,marker:212
'
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{**/.git,**/dist,**/node_modules}/*"'

# Openfaas configuration
set -x OPENFAAS_URL http://192.168.1.11:31112
set -x OPENFAAS_TEMPLATE_URL "git@github.com:Rblock919/openfaas-templates.git"

# Kubeconfig File
set -x KUBECONFIG /home/ryan/.config/netes/kubeconfig

# Add scripts to shell path
set PATH $PATH /home/ryan/Scripts/source

# Language Conf
set -x LC_ALL "en_US.UTF-8"

# Set script path for z plugin
set -gx Z_SCRIPT_PATH /home/ryan/.oh-my-zsh/plugins/z/z.sh

# Enable starship
starship init fish | source
