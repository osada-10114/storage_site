require "refile/s3"

aws = {
  access_key_id: "AKIAJZBJCAOYUUXT4CAA",
  secret_access_key: "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",
  region: "ap-northeast-1",
  bucket: "storage-site-s3",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)