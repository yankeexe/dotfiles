# Defined in - @ line 1
function acp --wraps='apt-cache policy' --description 'alias acp apt-cache policy'
  apt-cache policy $argv;
end
