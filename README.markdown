# Barry Hess Dot Files

My config files with heavy inspiration from [Err](http://errtheblog.com/posts/89-huba-huba), [Ryan Bates](http://github.com/ryanb/dotfiles/tree/master), [Elijah Miller](https://github.com/jqr/dotfiles) and other various web luminaries.

### Installation

<pre>
  git clone git://github.com/bjhess/dotfiles ~/.dotfiles
  cd ~/.dotfiles
  rake install
  # edit ~/.gitconfig and personalize it
</pre>

### Features

There are a couple git aliases/functions in my set that I haven't seen elsewhere.  Here's one to checkout a remote branch for the first time (assuming remote of "origin") with all the requisite tracking:

<pre>
  gcor branch_of_compadre
</pre>

Same as:

<pre>
  git branch --track branch_of_compadre origin/branch_of_compadre
  git checkout branch_of_compadre
</pre>

And a shortcut to create a new remote branch, check it out and track it locally:

<pre>
  gcobr my_new_branch
</pre>

Same as:

<pre>
  git branch my_new_branch
  git push origin my_new_branch
  git branch -D my_new_branch
  gcor my_new_branch
</pre>

Other than that, feel free to dink around and see what you can see.