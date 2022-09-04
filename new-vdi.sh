# ssh-add ~/.ssh/ft_linux
echo "[*] Removing old vdi..."
rm ~/sgoinfre/lumenthi-LFS.vdi
echo "[*] Removed old vdi !"

echo "[*] Copying template vdi..."
cp ~/sgoinfre/ft_linux_backups/lumenthi-LFS.vdi ~/sgoinfre/lumenthi-LFS.vdi
echo "[*] Copied template vdi !"

echo "[*] Generating checksum..."
shasum < ~/sgoinfre/lumenthi-LFS.vdi > shasum
echo "[*] Generated checksum !"

cat shasum
