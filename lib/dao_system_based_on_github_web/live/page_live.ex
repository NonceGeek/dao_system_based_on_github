defmodule DAOSystemBasedOnGithubWeb.PageLive do
  use DAOSystemBasedOnGithubWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       modal: false,
       slide_over: false,
       pagination_page: 1,
       active_tab: :live
     )}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    case socket.assigns.live_action do
      :index ->
        {:noreply, assign(socket, modal: false, slide_over: false)}

      :modal ->
        {:noreply, assign(socket, modal: params["size"])}

      :slide_over ->
        {:noreply, assign(socket, slide_over: params["origin"])}

      :pagination ->
        {:noreply, assign(socket, pagination_page: String.to_integer(params["page"]))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.container class="mt-10 mb-32">
      <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-3">
        <.card>
          <center>
            <.card_media src={~p"/images/logo_readme.png"} style="width: 50%"/>
          </center>

          <.card_content category="Profile" heading="Web3 Readme Generator">
            Generate Web3 Readme.md for User, Repo & Organization.
          </.card_content>

          <.card_footer>
            <a
              target="_blank"
              href="/readme_generator"
            >
              <.button label="View">
                <Heroicons.eye solid class="w-4 h-4 mr-2" />Go!
              </.button>
            </a>
          </.card_footer>
        </.card>

        <.card>
          <center>
            <.card_media src={~p"/images/logo_airdropper.png"} style="width: 50%"/>
          </center>
          <.card_content category="Economic" heading="Airdropper based on Github">
            Airdrop coins & NFTs for the contributors of Repos / Organiazations.
          </.card_content>

          <.card_footer>
            <a
            target="_blank"
            href="https://airdropper.movedid.build/">
              <.button to="/" label="View">
                <Heroicons.eye solid class="w-4 h-4 mr-2" />Move Version
              </.button>
            </a>
            <.button to="/" label="View">
              <Heroicons.eye solid class="w-4 h-4 mr-2" />Ethereum Version
            </.button>
          </.card_footer>
        </.card>

        <.card>
          <center>
            <.card_media src={~p"/images/logo_did.png"} style="width: 50%"/>
          </center>

          <.card_content category="DID" heading="MoveDID">
            Using MoveDID to link your Github account with your Web3 Account.
          </.card_content>

          <.card_footer>
            <a
              target="_blank"
              href="https://movedid.build/">
            <.button to="/" label="View">
              <Heroicons.eye solid class="w-4 h-4 mr-2" />MoveDID Mangager
            </.button>
            </a>
          </.card_footer>
        </.card>
      </div>
      </.container>
    """
  end

  @impl true
  def handle_event("close_modal", _, socket) do
    {:noreply, push_patch(socket, to: "/live")}
  end

  def handle_event("close_slide_over", _, socket) do
    {:noreply, push_patch(socket, to: "/live")}
  end
end
