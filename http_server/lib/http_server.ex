defmodule HttpServer do
  require Logger
  @port 8000
  @http_options [active: false, packet: :http_bin, reuseaddr: true]
  
  def start_link() do
    spawn_link(HttpServer, :init, [])
  end
  
  def init() do
    Process.flag(:trap_exit, true)
    
    start_listener()
    |> supervise()
  end
  
  def start_listener() do
    {:ok, socket} = :gen_tcp.listen(@port, @http_options)
    pid = spawn_link(HttpServer, :accept, [socket])
    Logger.info("Listener started #{inspect(pid)}")
    socket
  end
  
  def supervise(socket) do
    receive do
      {:EXIT, pid, reason} ->
        Logger.error("Listener process (#{inspect(pid)}) Crashed. #{reason}")
        :gen_tcp.close(socket)
        
        start_listener()
        |> supervise()
    end
  end
  
  def accept(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    pid = spawn(HttpServer, :handle, [client])
    :ok = :gen_tcp.controlling_process(client, pid)
    accept(socket)
  end
  
  def handle(client) do
    Logger.info("Servicing new request on pid #{inspect(self())}")
    body = "Hello From Elixir #{inspect(self())}"
    :gen_tcp.send(client, view(body))
    :gen_tcp.close(client)
  end
  
  def view(body) do
    [
      "HTTP/1.1 200\n",
      "Content-Type: text/html\n",
      "Content-Length: ",
      "#{byte_size(body)}",
      "\n\n",
      body
    ]
  end
  
end
