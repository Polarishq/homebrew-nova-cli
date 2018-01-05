class NovaCli < Formula
  desc "CLI tool to pipe logs to splunknova and search them"
  homepage "https://github.com/splunknova/nova-cli"

  stable do
    url "https://github.com/splunknova/nova-cli.git", :tag => "v0.3.3"
  end

  devel do
    url "https://github.com/splunknova/nova-cli.git", :tag => "v1.0.0"
  end

  depends_on "go" => :build

  def install
    ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/splunknova/nova-cli").install buildpath.children
    system "go", "env" # Debug env
    cd buildpath/"src/github.com/splunknova/nova-cli" do
      system "go", "build", "nova.go"
      bin.install "nova"
    end
  end

  test do
    system "#{HOMEBREW_PREFIX}/bin/nova", "--version"
  end
end
