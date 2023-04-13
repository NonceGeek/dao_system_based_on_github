defmodule DAOSystemBasedOnGithubWeb.ReadmeGeneratorLive do
  use DAOSystemBasedOnGithubWeb, :live_view
  alias DAOSystemBasedOnGithub.ReadmeGenerator
  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(
      socket,
      modal: false,
      form: to_form(%{}, as: :f),
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
  def handle_event(_key, _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.container class="mt-10 mb-32">
      <center><.h1 label="README Generator" /></center>
      <.form for={@form} phx-change="change_space" phx-submit="generate">

        <.h5 label="Your Name" />
        <.input field={@form[:name]} />

        <br>
          <.h5 label="MoveDID(Optional)" />
          <.textarea form={@form} field={:move_did} />

        <br>
        <.h5 label="Ethereum Address" />
        <.input field={@form[:eth_addr]} />

        <br>
        <.h5 label="Aptos Address" />
        <.input field={@form[:aptos_addr]} />

        <br>
        <.h5 label="Description(Supportted Markdown)" />
        <.textarea form={@form} field={:description} />

        <br>
        <.h5 label="Github Acct(Intelligent analysis of data in Github)" />
        <.input field={@form[:github_acct]} />

        <br>
        <.h5 label="Awesome Repos(Top5 Repos that you contributed with)" />
        <.input field={@form[:five_awesome_repos]} />

        <br>
        <center>
          <.button color="info" label="Generate Awesome REDME.md!" />
        </center>
      </.form>
      <%= if !is_nil(assigns[:readme_raw]) do %>
        <.h5 label="README.md" />
        <.textarea form={@form} value={assigns[:readme_raw]} />
      <% end %>
      </.container>
    """
  end

end
