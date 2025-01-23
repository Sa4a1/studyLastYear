using Firebase.Database;
using Firebase.Database.Query;
using System.Text;
using A21.Models;

namespace A21;

public partial class AddPage : ContentPage
{
	public AddPage()
	{
		InitializeComponent();
	}

    private void TypePicker_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        Tranings tran = new Tranings
        {
            Date = TrainingDatePicker.Date.ToString("dd.MM.yyyy"),
            Type = TypePicker.ItemsSource[TypePicker.SelectedIndex].ToString()
        };

        FirebaseClient train = new FirebaseClient("https://footballteam-6839b-default-rtdb.europe-west1.firebasedatabase.app/");
        await train.Child("Tranings").PostAsync(tran); // Передаем объект tran, а не строку "tran".
        await Navigation.PopAsync();
    }
}