require 'formula'

class Handbrakecli <Formula
   # @@dmgversion = 'svn3606'
   @@dmgversion = '0.9.9'
   @@osxversion = '6'
   @@arch = 'x86_64'
   @@dmgname = "HandBrake-#{@@dmgversion}-MacOSX.#{@@osxversion}_CLI_#{@@arch}"
   if /svn/.match(@@dmgversion)
      @@dmgurl = 'https://build.handbrake.fr/job/Mac/lastSuccessfulBuild/artifact/trunk/packages/'+@@dmgname+'.dmg'
      @@urlfile = @@dmgname+'.dmg'
   else
      @@dmgurl = 'http://handbrake.fr/rotation.php?file='+@@dmgname+'.dmg'
      @@urlfile = 'rotation.php'
   end

   homepage 'http://handbrake.fr/'
   url @@dmgurl, :using => NoUnzipCurlDownloadStrategy
   version "#{/svn/.match(@@dmgversion) ? @@dmgversion.sub(/svn/,'') : @@dmgversion}"
   sha1 '8c175265b18bea37a9072ea90406192462600141'

   # don't strip binaries
   skip_clean ['bin']

   def install
      mv @@urlfile, "#{name}-#{version}.dmg"
      system "hdiutil attach #{name}-#{version}.dmg"
      bin.mkdir
      cp "/Volumes/#{@@dmgname}/HandBrakeCLI", (bin+'HandBrakeCLI')
      chmod 0555, (bin+'HandBrakeCLI')
      system "hdiutil detach /Volumes/#{@@dmgname}"
   end
end
