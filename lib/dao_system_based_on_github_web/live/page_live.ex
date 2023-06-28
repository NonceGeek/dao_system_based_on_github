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
    
      <.container class="mt-10">

      </.container>

      <.container class="mt-10 mb-32">
        <center><.h1>DAO Plugin System based on Github</.h1>
        <br>
        <.h1>-[MoveDID Network]-</.h1>
        <br>
        <.h5>
          To let every open-source contributors on the planet be seen, connect and benefit from their helpful heart ❤️.
        </.h5>
        </center>
        <center><.h2 underline label="Apps"/></center>
        <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-3">
          <.card>
            <center>
              <.card_media src={~p"/images/logo_readme.png"} style="width: 50%"/>
            </center>

            <.card_content category="Profile" heading="Web3 Readme Generator">
              Generate Web3 Readme.md for User, Repo & Organization.
            </.card_content>

            <.card_footer>
            <.badge color="secondary" label="all chains" />
            <br><br>
            <a
              target="_blank"
              href="/readme_generator"
            >
              <.button label="View">
                Launch App
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
              <.badge color="primary" label="released" />
              <br>
              <.badge color="secondary" label="aptos" />
              <.badge color="secondary" label="ethereum" />
              <br><br>
              <a
              target="_blank"
              href="https://airdropper.movedid.build/">
                <.button to="/" label="View">
                  Move Version
                </.button>
              </a>
              <.button to="/" label="View">
                  Ethereum Version
              </.button>
            </.card_footer>
          </.card>

          <.card>
            <center>
              <.card_media src={~p"/images/logo_crowdfunder.png"} style="width: 50%"/>
            </center>

            <.card_content category="Economic" heading="Crowdfunder based on Github">
              Crowdfund coins for the Github Repos / Organiazations.
            </.card_content>

            <.card_footer>
              <.badge color="success" label="developing" />
              <br>
              <.badge color="secondary" label="aptos" />
              <.badge color="secondary" label="ethereum" />
              <br><br>
              <.button to="https://github.com/NonceGeek/Move-Crowdfunder" color="secondary" label="Secondary">
                  Github Repo
              </.button>
            </.card_footer>
          </.card>
        </div>

        <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-3">

          <.card>
            <center>
              <.card_media src={~p"/images/logo_github_linker.png"} style="width: 50%"/>
            </center>

            <.card_content category="Economic, Social" heading="Github Linker">
              Link Repos, Organizations and Users in Github.
            </.card_content>

            <.card_footer>
              <.badge color="secondary" label="aptos" />
              <.badge color="secondary" label="arweave" />
              <br><br>
              <a
                target="_blank"
                href="/github_linker"
              >
                <.button label="View">
                  Launch App
                </.button>
              </a>
            </.card_footer>
          </.card>

          <.card>
            <center>
              <.card_media src={~p"/images/logo_ai_self_studier.png"} style="width: 50%"/>
            </center>

            <.card_content category="Growth" heading="AI-based Studying Copilot">
              Link Repos, Organizations and Users in Github.
            </.card_content>

            <.card_footer>
              <.badge color="success" label="developing" />
              <.badge color="secondary" label="AI" />
              <br><br>
              <.button to="https://github.com/NonceGeek/chat-programming" color="secondary" label="Secondary">
                Github Repo
              </.button>
            </.card_footer>
          </.card>

          <.card>
          <center>
            <.card_media src={~p"/images/logo_ai_self_teacher.png"} style="width: 50%"/>
          </center>

          <.card_content category="Growth" heading="AI-based Teaching Copilot">
            Link Repos, Organizations and Users in Github.
          </.card_content>

          <.card_footer>
            <.badge color="success" label="developing" />
            <.badge color="secondary" label="AI" />
            <br><br>
            <.button to="https://github.com/NonceGeek/chat-programming" color="secondary" label="Secondary">
              Github Repo
            </.button>
          </.card_footer>
        </.card>
        </div>

        <br>
        <center><.h2 underline label="Tools" /></center>

        <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-3">

          <.card>
            <center>
              <.card_media src={~p"/images/logo_faas.png"} style="width: 50%"/>
            </center>

            <.card_content category="Infra" heading="TaiShang Micro FaaS">
              Function as a Service System for Web3.
            </.card_content>

            <.card_footer>
              <.badge color="primary" label="released" />
              <br><br>
              <a
                target="_blank"
                href="https://faas.noncegeek.com"
              >
                <.button label="View">
                  Launch App
                </.button>
              </a>
            </.card_footer>
          </.card>

          <.card>
            <center>
              <.card_media src={~p"/images/logo_move_e2e_test_tool.png"} style="width: 50%"/>
            </center>

            <.card_content category="Safety" heading="Move E2E Test Tool">
              The offline implementation for End-2-End Aptos Smart Contract Test Tool.
            </.card_content>

            <.card_footer>
              <.badge color="success" label="developing" />
              <br>
              <.badge color="secondary" label="aptos" />
              <br><br>
              <a
                target="_blank"
                href="https://github.com/NonceGeek/aptos_e2e_test_tool"
              >
                <.button to="/" color="secondary" label="Secondary">
                  Github Repo
                </.button>
              </a>
              
            </.card_footer>
          </.card>
        </div>

        <br>
        <center><.h2 underline label="Protocols" /></center>
        <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-3">

        <.card>
          <center>
            <.card_media src={~p"/images/logo_did.png"} style="width: 50%"/>
          </center>

          <.card_content category="Identity" heading="MoveDID">
            Using MoveDID to aggregate your addresses and services.
          </.card_content>

          <.card_footer>
            <.badge color="primary" label="released - beta" />
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

        <.card>
          <center>
            <.card_media src={~p"/images/logo_moveflow.png"} style="width: 50%"/>
          </center>

          <.card_content category="Economic" heading="Moveflow">
            Real-time, seamless, and uninterrupted payment streams.
          </.card_content>

          <.card_footer>
            <.badge color="primary" label="released - beta" />
            <br><br>
            <a
              target="_blank"
              href="https://www.moveflow.xyz/">
            <.button to="/" label="View">
              Homepage
            </.button>
            </a>
            <a
              target="_blank"
              href="https://app.moveflow.xyz/">
            <.button to="/" label="View">
              dApp
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
