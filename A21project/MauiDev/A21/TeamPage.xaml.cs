using A21.Models;

namespace A21;

public partial class TeamPage : ContentPage
{
	private readonly FirebaseService readService;
	public TeamPage()
	{
		InitializeComponent();
		readService = new FirebaseService();
		LoadPlayers();
	}

	private async void LoadPlayers()
	{
		var players = await readService.GetAllAsync<Players>();
        PlayersView.ItemsSource = players;

    }
}