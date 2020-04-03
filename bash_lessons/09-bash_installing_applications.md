# Installing software
sudo apt-get install packagename

# Finding the name of package and uninstalling it:
# To find the name of the package that is installed
# 1. Go to software center and search for the application
# 2. Scroll down to "Version" the packagename is the part before the first space in the Version.
sudo apt-get remove packagename

# Alternatively, if you know the path to a file which executes the application, you can also do
dpkg -S /path/to/file

# Following can also be a good way to find the packages associated with the "search name"
apt-cache search name

# If Software Center was not used, use
dpkg -S $(which searchname)

# In order to get a list of installed packages and save that to a home directory:
dpkg --get-selections > list.txt
# or
sudo dpkg --get-selections | sed "s/.*deinstall//" | sed "s/install$//g" > ~/list2.txt

# To install the packages from the list, saved earlier:
sudo dpkg --set-selections < list2.txt && sudo apt-get -u dselect-upgrade
