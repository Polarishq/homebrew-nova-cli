require 'formula'

class Ethereum < Formula
  homepage 'https://github.com/splunknova/nova-cli'
  url 'https://github.com/splunknova/nova-cli.git', :branch => 'master'

  depends_on 'go' => :build

  def install
    ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"
    system "go", "env" # Debug env
    system "go", "build", "nova.go"
    bin.install 'build/bin/nova'
  end

  test do
    system "#{HOMEBREW_PREFIX}/bin/nova", "--version"
  end
end
