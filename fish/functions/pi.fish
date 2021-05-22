# Defined in - @ line 1
function pi --wraps='pip install -r requirements.txt' --description 'alias pi pip install -r requirements.txt'
  pip install -r requirements.txt $argv;
end
