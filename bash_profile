source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Ruby gems always available
RUBYOPT="rubygems -Ilib:test"
export RUBYOPT

# Ruby tweakin'
export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_GC_HEAP_FREE_SLOTS=100000
export RUBY_GC_MALLOC_LIMIT=79000000

# Custom Harvest tweakage
# export RUN_GC_EVERY=7   # Disabling because slow MacBook Air

eval "$(rbenv init -)"
eval "$($HOME/.8/bin/8 init -)"
