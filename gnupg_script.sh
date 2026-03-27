uname -a #It provides information about the computer on which the code is running.
which gpg # location of the gpg binary
gpg --version #gives the version and additional information
gpg --full-generate-key #I generate public and private keys
gpg --list-keys #Displays all public GPG keys in your local keyring, including user IDs, key IDs, and fingerprints
gpg --armor --export #Exports a GPG public key to an ASCII-encapsulated text format, instead of binary.
gpg --list-secret-keys --keyid-format=long #This command is used to list the secret (private) GPG keys available in your keyring, showing their IDs in the full, long format.
gpg --armor --export-secret-keys A472F6F558168284 #Export the secret key
gpg --import my_key_publicaa.asc #The public key matters
$ #It indicates that you are operating with a standard user account, without full privileges over the system
echo #It's the command to print text. Basically, it tells the system: "Repeat what I'm about to type."
"love you cesar" #This is the first argument. The text you want to be processed.
> #It's the redirection operator. Instead of displaying the result on the screen, it "pours" it into a file.
doc_no_cifrado.txt #This is the name of the file that will receive the text. If it doesn't exist, Linux creates it; if it exists, it deletes the old file and writes the new one.
$ gpg --output doc_cifrado.txt --encrypt --recipient 561B9E443A91A0A7A257ACF201EE56537872D793 doc_no_cifrado.txt #With this command, I take your original text file and transform it into a "digital vault" that only the owner of that specific key can open.
gpg --decrypt MICOMPA_cifrado_doc.txt #With this command, I take that file that looks like digital garbage (MICOMPA_cifrado_doc.txt) and try to return it to its original state so that I can read it.
gpg --output doc_no_cifrado_firmado.txt --clearsign doc_no_cifrado.txt #This command is great because here I'm not hiding anything, but rather giving my digital "word of honor"!
gpg --verify MICOMPA_doc_no_cifrado_firmado.txt #When I execute this instruction, I am not opening a sealed envelope, but rather checking the authenticity seals of a document that is perfectly legible.
gpg --edit-key 561B9E443A91A0A7A257ACF201EE56537872D793 #When I execute this instruction, I don't just perform a single action and stop. Instead, I enter edit mode on the key that corresponds to that fingerprint. It's as if I open Cesar's entire file and wait for you to tell me what you want to change.
gpg --sign-key 01EE56537872D793 #It's basically my way of saying, "I have personally verified that this key really belongs to the owner of that ID."
gpg --verify MICOMPA_doc_no_cifrado_firmado.txt #When I execute this instruction, I am not opening a sealed envelope, but rather checking the authenticity seals of a document that is perfectly legible.
gpg --output doc_no_cifrado_firmado_binario.txt --sign doc_no_cifrado.txt #Instead of sealing an open letter, I would put the message in a sealed and compressed envelope that can only be read correctly if you use my tools to open it.
gpg --verify MICOMPA_doc_no_cifrado_firmado_binario.txt #I verify that my colleague's document is indeed signed
gpg --output firma_separada_doc_no_cifrado.sig --detach-sign doc_no_cifrado.txt #Or I become a notary who issues an independent certificate. Unlike previous methods where I wrapped the message or appended the signature, here I do something very elegant: I leave your original file exactly as it is and create a second file containing only the signature.

