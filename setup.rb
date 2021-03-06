#!/usr/bin/env ruby

require "pathname"
require "fileutils"
include FileUtils::Verbose

class String
  def expand
    ret = Pathname.new(self).expand_path
    ret.parent.mkpath unless ret.parent.exist?
    ret
  end
end

def sh(*args)
  puts args.join(" ")
  system(*args)
end

def link(src, dst)
  puts "#{src} =>\n\t#{dst}"
  src = Pathname.new(src).expand_path
  dst = Pathname.new(dst).expand_path
  dst.parent.mkpath unless dst.parent.exist?
  remove_file dst if dst.symlink?
  remove_file dst if dst.file?
  ln_sf src.to_s, dst.to_s
end


cd "~".expand

if "dotfiles".expand.exist?
  cd "dotfiles"
else
#  sh "git clone git@github.com:284km/dotfiles.git dotfiles"
  cd "dotfiles"
end

# "~/bin".expand.mkpath

# Dir["bin/*"].each do |f|
#   link f, "~/bin"
# end

link ".vimrc", "~/.vimrc"
# link ".gvimrc", "~/.gvimrc"
# link ".vim", "~/.vim"
# link ".nanorc", "~/.nanorc"

link ".zshrc", "~/.zshrc"
# link ".zsh", "~/.zsh"
# link ".ctags", "~/.ctags"

# link ".eclimrc", "~/.eclimrc"

# link ".irssi/scripts", "~/.irssi/scripts"

# これのせいで login loop に陥り2日悩んだ。このことは一生忘れない。
# link ".bash_profile", "~/.bash_profile"
# link ".bashrc", "~/.bashrc"

# link ".screenrc", "~/.screenrc"
# link ".tscreenrc", "~/.tscreenrc"
# link ".screen", "~/.screen"

link ".gemrc", "~/.gemrc"
link ".pryrc", "~/.pryrc"
link ".rubocop.yml", "~/.rubocop.yml"
link ".siegerc", "~/.siegerc"
link ".tigrc", "~/.tigrc"
link ".tmux.conf", "~/.tmux.conf"

# link ".bvirc", "~/.bvirc"
# link ".rascutrc", "~/.rascutrc"
# link ".re.pl", "~/.re.pl"
link ".irbrc", "~/.irbrc"
# link ".gdbinit", "~/.gdbinit"
# link ".my.cnf", "~/.my.cnf"

link "git/.gitconfig", "~/.gitconfig"
link "git/.gitignore", "~/.gitignore"
link ".bundle", "~/.bundle"

# cp ".gemrc", "~/.gemrc".expand unless Pathname.new("~/.gemrc").expand_path.exist?

# if RUBY_PLATFORM =~ /darwin/
#   link "/Applications/Firefox.app/Contents/MacOS/firefox-bin", "~/bin/firefox"
#   link "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome", "~/bin/chrome"
#   link "skk/my.rule", "~/Library/Application Support/AquaSKK/my.rule"
#   sh "gcc -framework Cocoa tools/set_default_browser.m -o #{ENV['HOME']}/bin/set_default_browser"
# end

