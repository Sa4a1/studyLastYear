using A21.Models;
namespace A21;

public partial class TraningsPage : ContentPage
{
    private readonly FirebaseService readService;
	public TraningsPage()
	{
        InitializeComponent();
        readService = new FirebaseService();
        LoadTrainigs();
    }

    private async void LoadTrainigs()
    {
        var tran = await readService.GetAllAsync<Tranings>();
        TrainingsView.ItemsSource = tran;

    }

    private async void AddTrainBtb_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddPage());
    }
}