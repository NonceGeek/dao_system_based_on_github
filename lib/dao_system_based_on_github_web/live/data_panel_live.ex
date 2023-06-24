defmodule DAOSystemBasedOnGithubWeb.DataPanelLive do
  use DAOSystemBasedOnGithubWeb, :live_view
  alias DAOSystemBasedOnGithub.ReadmeGenerator

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(
      socket,
      modal: false,
      form: to_form(%{}, as: :f),
      name: "",
      description: "",
      eth_addr: "",
      aptos_addr: "",
      five_awesome_repos: "",
      daos_joined_in: "",
      articles: ""
     )}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("generate", %{"f" => form_params}, socket) do
    readme_raw =
    form_params
    |> ExStructTranslator.to_atom_struct()
    |> ReadmeGenerator.generate()
    {
      :noreply,
      assign(
        socket,
        readme_raw: readme_raw
      )

    }
  end

  @impl true
  def handle_event("change", %{"f" => params}, socket) do
    params_atomed =
      ExStructTranslator.to_atom_struct(params)
    {
      :noreply,
      socket
      |> assign(name: params_atomed.name)
      |> assign(description: params_atomed.description)
      |> assign(eth_addr: params_atomed.eth_addr)
      |> assign(aptos_addr: params_atomed.aptos_addr)
      |> assign(five_awesome_repos: params_atomed.five_awesome_repos)
      |> assign(daos_joined_in: params_atomed.daos_joined_in)
      |> assign(articles: params_atomed.articles)
    }
  end

  @impl true
  def handle_event(_key, _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.container class="mt-10 mb-32">
      <center><.h1 underline label="Data Panel"/></center>
      <center><.h5>Hello World</.h5></center>
      <br>
      <center><.h2 label="Stage - Beta" /></center>

      <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-2">

      <!-- MoveDID -->
      <.card>
        <center>
          <.card_media src={~p"/images/logo_did.png"} style="width: 50%"/>
        </center>
        <.card_content category="Identity" heading="MoveDID">
          Using MoveDID to aggregate your addresses and services.
        </.card_content>

        <.card_footer>
          <.badge color="primary" label="released - beta" />
          <.card_content>
          <center> --- Onchain User Data --- </center>
          <center> --- Developer Data --- </center>
          </.card_content>
          <br><br>
          <a
            target="_blank"
            href="https://movedid.build/">
          <.button to="/" label="View">
            Homepage
          </.button>
          </a>

          <a
            target="_blank"
            href="https://manager.movedid.build/">
          <.button to="/" label="View">
            MoveDID Mangager
          </.button>
          </a>
        </.card_footer>
      </.card>
      </div>
      </.container>
    """
  end

end
