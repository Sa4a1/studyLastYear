using Firebase.Database;
using System.Text;
using Firebase.Database.Query;
using A21.Models;

namespace A21;

public partial class LogInPage : ContentPage
{
    FirebaseClient users;

    public LogInPage()
    {
        InitializeComponent();
        users = new FirebaseClient("https://footballteam-6839b-default-rtdb.europe-west1.firebasedatabase.app/");
    }

    private async void LogInBtn_Clicked(object sender, EventArgs e)
    {
        StringBuilder errors = new StringBuilder();

        // Проверка наличия введенных значений
        if (string.IsNullOrWhiteSpace(PasswordEntr.Text))
        {
            errors.AppendLine("Вы не ввели пароль!");
        }
        if (string.IsNullOrWhiteSpace(EmailEntr.Text))
        {
            errors.AppendLine("Вы не ввели электронную почту!");
        }

        if (errors.Length > 0)
        {
            await DisplayAlert("Ошибка", errors.ToString(), "OK");
            return;
        }

        var existingUsers = await users
            .Child("Users")
            .OrderBy("Email")
            .EqualTo(EmailEntr.Text)
            .OnceAsync<User>();
        if (existingUsers.Count == 0)
        {
            await DisplayAlert("Ошибка", "Пользователя с такой почтой не найдено!", "OK");
            return;
        }
        var user = existingUsers.First().Object;

        DisplayAlert("Вы успешно авторизовались", "", "OK");
        await Navigation.PushAsync(new MainPage());
    }

    async void SingUpBtn_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new SingUp());
    }
}