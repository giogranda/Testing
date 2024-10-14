pid_file = "./pidfile"

vault {
  address = "http://52.90.105.224:8200"
  retry {
    num_retries = 2
  }
}
vault {
  address = "http://127.0.0.1:8200"
  retry {
    num_retries = 2
  }
}

auto_auth {
  method {
    type      = "approle"
    config = {
      role_id_file_path = "/tmp/role"
      secret_id_file_path = "/tmp/secret"
      remove_secret_id_file_after_reading = false
    }
  }
}
  sink "file" {
    config = {
      path = "/tmp/file-foo"
    }
  }

cache {
  // An empty cache stanza still enables caching
}
api_proxy {
  use_auto_auth_token = true
}
listener "tcp" {
  address = "127.0.0.1:8100"
  tls_disable = true
}

