# Defined in - @ line 1
function update --wraps='apt-get update' --wraps='sudo apt-get update' --description 'alias update sudo apt-get update'
  sudo apt-get update $argv;
end
