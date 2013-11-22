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
export RUBY_HEAP_MIN_SLOTS=4000000
export RUBY_HEAP_FREE_MIN=400000
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

# T.J.'s numbers
# export RUBY_HEAP_MIN_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=1000000000
# export RUBY_HEAP_FREE_MIN=500000

# Custom Harvest tweakage
# export RUN_GC_EVERY=7   # Disabling because slow MacBook Air

eval "$(rbenv init -)"
eval "$($HOME/.8/bin/8 init -)"
