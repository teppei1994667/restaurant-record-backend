Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "localhost:3001" # Next.jsを動作させているアドレスとポート番号

    resource "*",
      headers: :any,
      expose: ["access-token", "uid", "client"],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
