# Defined in - @ line 1
function va --wraps='python3 -m venv venv' --wraps='source venv/bin/activate' --wraps='source venv/bin/activate.fish' --description 'alias va source venv/bin/activate.fish'
  source venv/bin/activate.fish $argv;
end
