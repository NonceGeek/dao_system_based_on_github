defmodule Constants do
    def get_github_token() do
      System.get_env("GITHUB_TOKEN")
    end

  end
