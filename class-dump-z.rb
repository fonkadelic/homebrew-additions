require 'formula'

class ClassDumpZ < Formula
  homepage 'http://code.google.com/p/networkpx/wiki/class_dump_z'
  url 'http://networkpx.googlecode.com/files/class-dump-z_0.2a.tar.gz'
  sha1 '8adebf198d3691ee38558ae1bb3fe9888e3a193e'

  skip_clean "mac_x86"
  def install
    bin.install 'mac_x86/class-dump-z'
  end
end
