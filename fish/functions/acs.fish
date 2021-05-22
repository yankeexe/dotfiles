# Defined in - @ line 1
function acs --wraps='apt-cache search' --description 'alias acs apt-cache search'
  apt-cache search $argv;
end
