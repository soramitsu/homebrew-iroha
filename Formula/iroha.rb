class Iroha < Formula
    desc "Hyperledger Iroha — distributed ledger technology platform"
    homepage "http://iroha.tech/en"
    url "https://github.com/hyperledger/iroha.git", :branch => "develop"
    version "v0.95_preview-2"

    depends_on "libtool"
    depends_on "tbb"
    depends_on "postgres"
    depends_on "boost"
    depends_on "grpc"
  
    resource "iroha_cli" do
      url "https://github.com/hyperledger/iroha/releases/download/v0.95_preview-2/iroha-cli-mac"
      sha1 "8eff9f5ccba6a040e79575c68e8f5940d461d0f2"
    end

    resource "irohad" do
      url "https://github.com/hyperledger/iroha/releases/download/v0.95_preview-2/irohad-mac"
      sha1 "8eff9f5ccba6a040e79575c68e8f5940d461d0f2"
    end

    def install
      resource("irohad").stage { bin.install "irohad-mac" }
      resource("iroha_cli").stage { bin.install "iroha-cli-mac" }
    end
  
    test do
        system "#{bin}/iroha-cli-mac", "--help"
    end
  end