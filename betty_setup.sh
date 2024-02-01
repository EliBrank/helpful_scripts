#!/bin/bash

repo="https://github.com/hs-hq/Betty.git"

git clone $repo

BETTY_STYLE="betty-style"
BETTY_DOC="betty-doc"
BETTY_WRAPPER="betty"

APP_PATH="/opt/betty"
BIN_PATH="/usr/local/bin"
MAN_PATH="/usr/local/share/man/man1"

echo -e "Installing binaries.."

mkdir -p "${APP_PATH}"

cp "${BETTY_STYLE}.pl" "${APP_PATH}/${BETTY_STYLE}"
cp "${BETTY_DOC}.pl" "${APP_PATH}/${BETTY_DOC}"
cp "${BETTY_WRAPPER}.sh" "${APP_PATH}/${BETTY_WRAPPER}"

chmod +x "${APP_PATH}/${BETTY_STYLE}"
chmod +x "${APP_PATH}/${BETTY_DOC}"
chmod +x "${APP_PATH}/${BETTY_WRAPPER}"

ln -s "${APP_PATH}/${BETTY_STYLE}" "${BIN_PATH}/${BETTY_STYLE}"
ln -s "${APP_PATH}/${BETTY_DOC}" "${BIN_PATH}/${BETTY_DOC}"
ln -s "${APP_PATH}/${BETTY_WRAPPER}" "${BIN_PATH}/${BETTY_WRAPPER}"

echo -e "Installing man pages.."

mkdir -p "${MAN_PATH}"

cp "man/betty.1" "${MAN_PATH}"
cp "man/${BETTY_STYLE}.1" "${MAN_PATH}"
cp "man/${BETTY_DOC}.1" "${MAN_PATH}"

echo -e "Updating man database.."

mandb

# create and populate betty script
cat <<EOF > betty
#!/bin/bash
# Simply a wrapper script to keep you from having to use betty-style
# and betty-doc separately on every item.
# Originally by Tim Britton (@wintermanc3r), multiargument added by
# Larry Madeo (@hillmonkey)

BIN_PATH="/usr/local/bin"
BETTY_STYLE="betty-style"
BETTY_DOC="betty-doc"

if [ "\$#" = "0" ]; then
    echo "No arguments passed."
    exit 1
fi

for argument in "\$@" ; do
    echo -e "\n========== \$argument =========="
    \${BIN_PATH}/\${BETTY_STYLE} "\$argument"
    \${BIN_PATH}/\${BETTY_DOC} "\$argument"
done
EOF

chmod 755 betty

mv betty /bin

rm -r Betty
