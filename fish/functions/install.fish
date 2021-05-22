# Defined in - @ line 1
function install --wraps='sudo apt-get install' --description 'alias install sudo apt-get install'
  sudo apt-get install $argv;
end
