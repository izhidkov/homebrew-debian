class DebianKeyring < Formula
  homepage "http://packages.qa.debian.org/debian-keyring"
  url "http://ftp.debian.org/debian/pool/main/d/debian-keyring/debian-keyring_2015.04.10.tar.xz"
  sha256 "02125a0693a3a7ccabbe966e26eb2ad0bed3f348d15fc7206fbae68f1e853786"
  devel do
    url "http://ftp.debian.org/debian/pool/main/d/debian-keyring/debian-keyring_2015.06.19.tar.xz"
    sha256 "3a7ed046a45ca9512dfd9b90e30feeb266c65245ae0cbb37f101a70b4adb2519"
  end

  depends_on "coreutils" => :build

  def install
    inreplace "Makefile", "sha512sum", "gsha512sum"
    system "make"
    %w[debian-keyring debian-maintainers].each do |file|
      (share/"keyrings").install "output/keyrings/#{file}.gpg"
    end
  end
end
