#see the principal group
id
#only see the principal group name 
id -gn
#creat a file and inherit group
touch ~/test_grupo_heredado.txt
#the group it's the principal group of teh user
la -la ~/test_grupo_heredado.txt
