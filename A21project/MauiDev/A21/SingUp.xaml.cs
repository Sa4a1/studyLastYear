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

        // Проверка наличия введенных значений
        if (string.IsNullOrWhiteSpace(PasswordEntr.Text))
        {
            errors.AppendLine("Вы не ввели пароль!");
        }
        if (string.IsNullOrWhiteSpace(EmailEntr.Text))
        {
            errors.AppendLine("Вы не ввели электронную почту!");
        }

        if (!Cheker.PasswordCheck(PasswordEntr.Text))
        {
            errors.AppendLine("Пароль должен содержать минимум 8 символов из которых один должен быть прописной буквой и еще один заглавной!");
            return;
        }
        // Если ошибки найдены, выводим сообщение и прекращаем выполнение
        if (errors.Length > 0)
        {
            await DisplayAlert("Ошибка", errors.ToString(), "ОК");
            return;
        }

        // Проверяем, существует ли пользователь с таким email
        var existingUsers = await user
            .Child("Users")
            .OrderBy("Email")
            .EqualTo(EmailEntr.Text)
            .OnceAsync<User>();

        if (existingUsers.Count > 0)
        {
            await DisplayAlert("Ошибка", "Пользователь с таким email уже существует", "ОК");
            return;
        }

        // Создаем нового пользователя
        var newUser = new User
        {
            Email = EmailEntr.Text,
            Password = PasswordEntr.Text,
            Role = "User"
        };

        // Сохраняем нового пользователя в базу данных
        await user.Child("Users").PostAsync(newUser);

        await DisplayAlert("Успех", "Пользователь успешно зарегистрирован", "ОК");
        await Navigation.PopAsync();
    }

}