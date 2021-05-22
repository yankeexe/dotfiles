function ss
	eval (ssh-agent -c)
	ssh-add ~/.ssh/id_rsa
end
