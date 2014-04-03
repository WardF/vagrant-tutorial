# Bash Script to provision a basic ubuntu web server.

# Update packages, install apache2 and links
apt-get update
apt-get -y install links apache2 markdown

# Render the README.md file into html,
# make it the default page.
markdown /vagrant/README.md > /vagrant/index.html
rm -rf /var/www/index.html
ln -s /vagrant/index.html /var/www/index.html
