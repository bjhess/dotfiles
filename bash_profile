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
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_MIN_SLOTS=600000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_GC_MALLOC_LIMIT=50000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

# Custom Harvest tweakage
# export RUN_GC_EVERY=7   # Disabling because slow MacBook Air

eval "$(rbenv init -)"
eval "$($HOME/.8/bin/8 init -)"
