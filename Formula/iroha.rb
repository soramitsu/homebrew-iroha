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
      sha256 "85f177a641b5c636237c7271b69aca530d1aa444766325e5c67eddcf2c0a26a1"
    end

    resource "irohad" do
      url "https://github.com/hyperledger/iroha/releases/download/v0.95_preview-2/irohad-mac"
      sha256 "8ab188a77eaf11492df4540698309490485be3b4470778aa50639009d17e4e0f"
    end

    def install
      resource("irohad").stage { bin.install "irohad-mac" }
      resource("iroha_cli").stage { bin.install "iroha-cli-mac" }
    end
  
    test do
        system "#{bin}/iroha-cli-mac", "--help"
    end
  end