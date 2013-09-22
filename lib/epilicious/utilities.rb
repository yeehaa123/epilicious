module Epilicious
  module Utilities

    def self.symbolize_keys(import_hash)
      import_hash.keys.each do |key|
        import_hash[(key.to_sym rescue key) || key] = import_hash.delete(key)
      end
      import_hash
    end

    def self.strip_url(url)
      url.gsub!(/http\:\/\/[^\/]+/, "")
    end
  end
end
