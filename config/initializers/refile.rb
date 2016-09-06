require "refile/s3"

aws = {
  access_key_id: "AKIAJRHIVDVFTGVAF2LA",
  secret_access_key: "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",
  region: "us-west-2",
  bucket: "blog-engine-images"
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
