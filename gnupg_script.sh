uname -a #It provides information about the computer on which the code is running.
which gpg # location of the gpg binary
gpg --version #gives the version and additional information
gpg --full-generate-key gpg --list-secret-keys --keyid-format=long#I generate public and private keys
gpg --list-keys #Displays all public GPG keys in your local keyring, including user IDs, key IDs, and fingerprints
gpg --armor --export #Exports a GPG public key to an ASCII-encapsulated text format, instead of binary.
gpg --list-secret-keys --keyid-format=long #This command is used to list the secret (private) GPG keys available in your keyring, showing their IDs in the full, long format.
gpg --armor --export-secret-keys A472F6F558168284 #Export the secret key
gpg --import mi_llave_pub.asc #The public key matters
$ echo "te amo cesar"> doc_no_cifrado.txt cesar.arciniegas.mejia4@gmail.com doc_no_cifrado.txt #Create the text file
$ gpg --output doc_cifrado.txt --encrypt --recipient cesar.arciniegas.mejia4@gmail.com doc_no_cifrado.txt #Encrypt the document