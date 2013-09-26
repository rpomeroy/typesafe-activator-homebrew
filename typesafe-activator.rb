require 'formula'

class TypesafeActivator < Formula
  homepage 'http://typesafe.com/platform/getstarted'
  url 'http://downloads.typesafe.com/typesafe-activator/1.0.0/typesafe-activator-1.0.0.zip'
  sha1 '9bbe02637e15f401fab28fcfbb038c43c17fbeba'

  def install
    rm "activator.bat"

    inreplace "activator" do |s|
      s.gsub! /^declare -r activator_home=.*$/, "declare -r activator_home=#{libexec}"
    end

    libexec.install Dir["*"]
    bin.install_symlink libexec/"activator"
  end
end