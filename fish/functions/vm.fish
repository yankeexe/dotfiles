# Defined in - @ line 1
function vm --wraps='python3 -m venv venv' --description 'alias vm python3 -m venv venv'
  python3 -m venv venv $argv;
end
