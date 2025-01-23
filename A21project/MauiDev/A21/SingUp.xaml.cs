using System.Text;
using Firebase.Database;
using Firebase.Database.Query;
using A21.Models;

namespace A21;

public partial class SingUp : ContentPage
{



    public SingUp()
	{
		InitializeComponent();


	}

    private async void SignUpBtn_Clicked(object sender, EventArgs e)
    {
        StringBuilder errors = new StringBuilder();
        FirebaseClient user = new FirebaseClient("https://footballteam-6839b-default-rtdb.europe-west1.firebasedatabase.app/");

        // �������� ������� ��������� ��������
        if (string.IsNullOrWhiteSpace(PasswordEntr.Text))
        {
            errors.AppendLine("�� �� ����� ������!");
        }
        if (string.IsNullOrWhiteSpace(EmailEntr.Text))
        {
            errors.AppendLine("�� �� ����� ����������� �����!");
        }

        if (!Cheker.PasswordCheck(PasswordEntr.Text))
        {
            errors.AppendLine("������ ������ ��������� ������� 8 �������� �� ������� ���� ������ ���� ��������� ������ � ��� ���� ���������!");
            return;
        }
        // ���� ������ �������, ������� ��������� � ���������� ����������
        if (errors.Length > 0)
        {
            await DisplayAlert("������", errors.ToString(), "��");
            return;
        }

        // ���������, ���������� �� ������������ � ����� email
        var existingUsers = await user
            .Child("Users")
            .OrderBy("Email")
            .EqualTo(EmailEntr.Text)
            .OnceAsync<User>();

        if (existingUsers.Count > 0)
        {
            await DisplayAlert("������", "������������ � ����� email ��� ����������", "��");
            return;
        }

        // ������� ������ ������������
        var newUser = new User
        {
            Email = EmailEntr.Text,
            Password = PasswordEntr.Text,
            Role = "User"
        };

        // ��������� ������ ������������ � ���� ������
        await user.Child("Users").PostAsync(newUser);

        await DisplayAlert("�����", "������������ ������� ���������������", "��");
        await Navigation.PopAsync();
    }

}