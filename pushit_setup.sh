#!/bin/bash

cat <<EOF > pushit
#!/bin/bash

git add -A
echo "Enter commit title: "
read commit_title
git commit -m "$commit_title"
git push
EOF

chmod 755 pushit

mv pushit /bin
