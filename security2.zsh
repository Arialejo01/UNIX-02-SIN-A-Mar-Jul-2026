#see the principal group
id
#only see the principal group name 
id -gn
#creat a file and inherit group
touch ~/test_grupo_heredado.txt
#the group it's the principal group of teh user
la -la ~/test_grupo_heredado.txt

# View the current group
id -gn
echo "Grupo actual: $(id -gn)"
# Create a file before newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt

# Switch to the developers group
newgrp desarrolladores
# Verify that the active group changed      
id -gn
echo "Nuevo grupo activo: $(id -gn)"

# Create a file inside the subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
# The group is now 'developers'
# create a directory
mkdir -p ~/proyecto_dev/src
ls -la ~/