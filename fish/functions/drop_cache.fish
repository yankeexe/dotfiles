# Defined in - @ line 1
function drop_cache --wraps=sudo\ sh\ -c\ \"echo\ 3\ \>\'/proc/sys/vm/drop_caches\'\ \&\&\ swapoff\ -a\ \&\&\ swapon\ -a\ \&\&\ printf\ \'\\n\%s\\n\'\ \'Ram-cache\ and\ Swap\ Cleared\'\" --description alias\ drop_cache=sudo\ sh\ -c\ \"echo\ 3\ \>\'/proc/sys/vm/drop_caches\'\ \&\&\ swapoff\ -a\ \&\&\ swapon\ -a\ \&\&\ printf\ \'\\n\%s\\n\'\ \'Ram-cache\ and\ Swap\ Cleared\'\"
  sudo sh -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'" $argv;
end
