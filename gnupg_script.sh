uname -a #brinda infromacion del ordenador en el que se opera el codigo
which gpg # ubicacion del binario del gpg
gpg --version #da la versioin e informacion adicional
gpg --full-generate-key #genero llave publica y privada
gpg --list-keys #Muestra todas las claves GPG públicas de su llavero local, incluidos los ID de usuario, los ID de clave y las huellas digitales
gpg --armor --export #Exporta una clave pública GPG a un formato de texto encapsulado en ASCII, en lugar de binario
gpg --list-secret-keys --keyid-format=long #Este comando se utiliza para listar las claves GPG secretas (privadas) disponibles en su llavero, mostrando sus ID en el formato completo y largo.
