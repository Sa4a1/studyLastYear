using Android.App;
using Android.Content.PM;
using Android.OS;

namespace A21
{
    [Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true, LaunchMode = LaunchMode.SingleTop, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
    public class MainActivity : MauiAppCompatActivity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Устанавливаем цвет статуса бара
            Window.SetStatusBarColor(Android.Graphics.Color.ParseColor("#FF0000")); // Красный цвет

        }
    }
}
