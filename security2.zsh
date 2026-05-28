#see the principal group
id
#only see the principal group name 
id -gn
#creat a file and inherit group
touch ~/test_grupo_heredado.txt
#the group it's the principal group of teh user
la -la ~/test_grupo_heredado.txt

# View the current group
id - gn
echo "Grupo actual: $(id-gn)"
# Create a file before newgrp
touch ~/antes_de_newgrp.txt
Is -la ~/antes_de_newgrp.txt