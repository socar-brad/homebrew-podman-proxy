class PodmanProxy < Formula
  desc ""
  homepage ""
  license ""
  url "https://github.com/socar-brad/podman-proxy.git",
      tag:      "v0.0.1",
      revision: "3ce7abbb8eadb99b7690740c466f1d0830b06f15"
  head "https://github.com/socar-brad/podman-proxy.git", branch: "main"

  # depends_on "cmake" => :build

  depends_on "go" => :build

  def install
    puts buildpath
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/socar-brad/podman-proxy"
    dir.install (buildpath/"").children

    cd dir do
      system "go", "build", "-o", "#{bin}/podman-proxy"
    end

    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test podman-proxy`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # system "false"
  end
end

