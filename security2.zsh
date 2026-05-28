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

# proyecto_dev/ have group 'desarrolladores'
# Exit the newgrp subshell
exit
# Verify that we returned to the original group
id -gn
echo "Grupo restaurado: $(id-gn)"

# compare the two files
ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt

# newgrp creates a subshell - this is demonstrable
echo "PID del shell actual: $$"
newgrp desarrolladores
echo "PID dentro de newgrp: $$"
# The PID is different - it's a child process

# Create a group with a password: sudo groupadd grupo_restringido
sudo gpasswd grupo_restringido
# The system will ask for a password for the group

# A user who does NOT belong to the group can unirse temporalmente si conoce la contraseña
newgrp grupo_restringido
# The system will ask for the group password
# If the password is correct, you will be temporarily joined
id - gn
exit # Upon leaving, you lose your temporary membership