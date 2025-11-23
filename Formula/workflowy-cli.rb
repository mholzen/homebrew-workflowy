class WorkflowyCli < Formula
  desc "CLI for WorkFlowy with analytics and reporting"
  homepage "https://github.com/mholzen/workflowy"
  url "https://github.com/mholzen/workflowy/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bb9c57f91e87845764413473bdc98136931c17c0aa8378e4a6002d8c60e0d6fd"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/workflowy"
  end

  test do
    assert_match "workflowy", shell_output("#{bin}/workflowy --help")
  end
end
