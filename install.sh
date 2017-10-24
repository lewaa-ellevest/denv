echo "Installing Lewaa Bahmad's denvelopment environment..."

pip install --user powerline-status
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts/
