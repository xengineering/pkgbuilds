

# PKGBUILDs

This is my personal collection of PKGBUILD files. They describe the packaging process of software for Arch Linux.


## Usage

### Build and install a Package

If you just cloned this repository with ```git clone https://github.com/xengineering/pkgbuilds.git``` you can compile and install packages from it manually like this:

```
cd pkgbuilds/xengineering-base-meta  # you can select any other project
makepkg  # builds the package
sudo pacman -U *.pkg.tar.zst  # installs the package
```

### Add xengineering's Repository to your Arch Linux Installation

If you want to use my pre-compiled packages and trust me you can add my personal repository to your installation. This will also update my packages on your system if you upgrade with ```sudo pacman -Syu```.

**Disclaimer:** This adds my PGP key to your pacman key ring! Thus your Arch Linux installation will accept any package signed by me (so you have to trust me).

```
# Add PGP key
curl https://xengineering.eu/xengineering.asc > xengineering.asc
sudo pacman-key --add xengineering.asc    # add key to pacman key ring
sudo pacman-key --finger xengineering     # make sure that the fingerprint is A13B 2588 7878 7F94 3F6C  68F0 0FD1 F842 33FA 8900
sudo pacman-key --lsign-key xengineering  # trust this key for package installation

# Add repository
sudo nano /etc/pacman.conf

# Append this text:
[xengineering]
Server = https://xengineering.eu/archlinux/repositories/xengineering/os/$arch

# Close nano editor - then this should work well:
sudo pacman -Syyu  # update repositories
sudo pacman -S <pkg from xengineering>
```

