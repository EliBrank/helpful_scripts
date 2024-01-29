#!/bin/bash

cat <<EOF > pushit
#!/bin/bash

read -p "Enter a commit message: " commit_message

git add -A
git commit -m "\$commit_message"
git push
EOF

chmod 755 pushit

mv pushit /bin
