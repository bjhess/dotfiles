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
export RUBY_HEAP_MIN_SLOTS=2000000
export RUBY_HEAP_FREE_MIN=20000
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

# Custom Harvest tweakage
# export RUN_GC_EVERY=7   # Disabling because slow MacBook Air

eval "$(rbenv init -)"
eval "$($HOME/.8/bin/8 init -)"
