defmodule PollerPhxWeb.Router do
  use PollerPhxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PollerPhxWeb do
    pipe_through :browser

    get "/", PageController, :index
  end
  
  scope "/districts", PollerPhxWeb do
    pipe_through :browser
    
    resources "/", DistrictController, except: [:show] 
  end

  # Other scopes may use custom stacks.
  # scope "/api", PollerPhxWeb do
  #   pipe_through :api
  # end
end
