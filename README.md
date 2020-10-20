# This is the guide to create git and github connection with SSH key

- Make a folder

- Generate a key: `ssh-keygen -t rsa -b 4096 -C "your_git_email@email.com"`

- Save as "a_key.ssh" (just press enter)

- Make a passphrase (optional but good practise)

- Check that "a_key.ssh" is in folder

- Ensure you have the git agent `eval $(ssh-agent -s)`

- Add the key `ssh-add a_key.ssh`

- Go to github, go to settings, "SSH and GPG keys", "new SSH key"

- Back to terminal `cat key.ssh.pub`

- Copy whole key in terminal and paste into new key with title, save it

## Create a github account

- copy the key from the local host with 

`cat id_rsa.pub`

- Paste the public key on your github in settings GPG SSH key option in your profile menu
- once saved go back to your terminal
- run the github command

```git add .
git commit -m " logical commit message "
git push -u origin main```

- go back to the github repo to verify the changes

