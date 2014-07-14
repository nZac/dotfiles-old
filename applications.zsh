applications=(
    'google-chrome'
    'iterm2'
    'mysqlworkbench'
    'firefox'
    'alfred'
    'dash'
    'caffeine'
    'sourcetree'
    'spotify'
    'bettertouchtool'
    'cyberduck'
    'paw'
    'nvalt'
    'Divvy'
    'pycharm'
)

brew tap caskroom/cask
brew install brew-cask

for app in $applications; do
    echo "\n\n"
    echo "Installing $app next."
    brew cask install $app
done


