# Defined in - @ line 1
function upgrade --wraps='sudo apt-get upgrade' --description 'alias upgrade sudo apt-get upgrade'
  sudo apt-get upgrade $argv;
end
