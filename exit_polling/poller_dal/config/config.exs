use Mix.Config

config :poller_dal, PollerDal.Repo,
  database: "poller_#{Mix.env()}",
  username: "knowthen",
  password: "",
  hostname: "localhost"
  
config :poller_dal, ecto_repos: [PollerDal.Repo]
