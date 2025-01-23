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

        // �������� ������� ��������� ��������
        if (string.IsNullOrWhiteSpace(PasswordEntr.Text))
        {
            errors.AppendLine("�� �� ����� ������!");
        }
        if (string.IsNullOrWhiteSpace(EmailEntr.Text))
        {
            errors.AppendLine("�� �� ����� ����������� �����!");
        }

        if (errors.Length > 0)
        {
            await DisplayAlert("������", errors.ToString(), "OK");
            return;
        }

        var existingUsers = await users
            .Child("Users")
            .OrderBy("Email")
            .EqualTo(EmailEntr.Text)
            .OnceAsync<User>();
        if (existingUsers.Count == 0)
        {
            await DisplayAlert("������", "������������ � ����� ������ �� �������!", "OK");
            return;
        }
        var user = existingUsers.First().Object;

        DisplayAlert("�� ������� ��������������", "", "OK");
        await Navigation.PushAsync(new MainPage());
    }

    async void SingUpBtn_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new SingUp());
    }
}