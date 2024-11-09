using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProjectOrg
{
    /// <summary>
    /// Логика взаимодействия для DealPage.xaml
    /// </summary>
    public partial class DealPage : Page
    {

        List <DesingWork> CurrentPage = new List <DesingWork> ();
        List<DesingWork> TableList;


        public DealPage()
        {
            InitializeComponent();
            var currentDesingWorks = ProjectOranizationDBEntities.GetContext().DesingWork.ToList();
            DesingWorkListView.ItemsSource = currentDesingWorks;
            SortBox.SelectedIndex = 0;
            FiltBox.SelectedIndex = 0;
            Update();
        }

       void Update()
        {
            var currentDesingWorks = ProjectOranizationDBEntities.GetContext().DesingWork.ToList();


 


            if (SortBox.SelectedIndex == 1) currentDesingWorks = currentDesingWorks.OrderBy(p => p.EndDate).ToList();
            if (SortBox.SelectedIndex == 2) currentDesingWorks = currentDesingWorks.OrderByDescending(p => p.EndDate).ToList();

            if(FiltBox.SelectedIndex == 1) currentDesingWorks = currentDesingWorks.Where(p => (p.DepartmentID == 1)).ToList();
            if(FiltBox.SelectedIndex == 2) currentDesingWorks = currentDesingWorks.Where(p =>  p.DepartmentID == 2).ToList();
            if(FiltBox.SelectedIndex == 3) currentDesingWorks = currentDesingWorks.Where(p => (p.DepartmentID == 3)).ToList();
            if(FiltBox.SelectedIndex == 4) currentDesingWorks = currentDesingWorks.Where(p => (p.DepartmentID == 4)).ToList();
            if(FiltBox.SelectedIndex == 5) currentDesingWorks = currentDesingWorks.Where(p => (p.DepartmentID == 5)).ToList();

            currentDesingWorks = currentDesingWorks.Where(p => (p.dealID.ToString().Contains(SearchTxt.Text) || p.OrgName.ToLower().Contains(SearchTxt.Text.ToLower()) )).ToList();
            int recCount = currentDesingWorks.Count;
            TBCount.Text = recCount.ToString();
            DesingWorkListView.ItemsSource = currentDesingWorks;
          
        }

        private void SortBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void SearchTxt_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void FiltBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            Manager.Frame.Navigate(new EditorPage(null));
        }

        private void DesingWorkListView_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if(Visibility == Visibility.Visible)
            {
                ProjectOranizationDBEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DesingWorkListView.ItemsSource = ProjectOranizationDBEntities.GetContext().DesingWork.ToList();
                Update();
            }
        }

        private void EditBtn_Click(object sender, RoutedEventArgs e)
        {
            
            Manager.Frame.Navigate(new EditorPage((sender as Button).DataContext as DesingWork));
        }

        private void DeleteBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedWork = (sender as Button).DataContext as DesingWork;
            if (selectedWork.EndDate > new DateTime(2015, 1, 1))
            {
                MessageBox.Show("Запись не может быть удалена, потому что данную работу закончили после первого января 2015-го года ");
            }
            else

            { if (MessageBox.Show("Вы точно хотите выполнить удаление?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    try
                    {
                        ProjectOranizationDBEntities.GetContext().DesingWork.Remove(selectedWork);
                        ProjectOranizationDBEntities.GetContext().SaveChanges();
                        DesingWorkListView.ItemsSource = ProjectOranizationDBEntities.GetContext().DesingWork.ToList();
                        Update();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString());
                    }
                }
            }
        }
    }
}
