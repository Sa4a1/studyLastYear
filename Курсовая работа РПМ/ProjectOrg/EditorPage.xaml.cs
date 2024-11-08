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
    /// Логика взаимодействия для EditorPage.xaml
    /// </summary>
    public partial class EditorPage : Page
    {

        private DesingWork _currentDesignWork = new DesingWork();
        public EditorPage(DesingWork SelectedDesignWork)
        {
            InitializeComponent();

            if(SelectedDesignWork != null) _currentDesignWork = SelectedDesignWork;
             

            DataContext = _currentDesignWork; 
        }



        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(DealTxt.Text)) errors.AppendLine("Введите номер договора по которму проводится работа!");
            else
            {
                int dealId;
                bool isValidDealId = int.TryParse(DealTxt.Text, out dealId);

                if (!isValidDealId || !ProjectOranizationDBEntities.GetContext().Deal.Any(p => p.DealID == dealId))
                {
                    errors.AppendLine("Нет такого договора!");
                }
            }
            if (string.IsNullOrWhiteSpace(StartDateDp.ToString())) errors.AppendLine("Введите дату начала работ!");
            else _currentDesignWork.StartDate = (DateTime)StartDateDp.SelectedDate;
            if (string.IsNullOrWhiteSpace(EndDateDp.ToString())) errors.AppendLine("Введите дату конца работ!");
            else _currentDesignWork.EndDate = (DateTime)EndDateDp.SelectedDate;
            if (DepartmentBox.SelectedIndex == 0 || DepartmentBox.SelectedIndex == null) errors.AppendLine("Выберите отдел Испольнитель!");
            else _currentDesignWork.DepartmentID = DepartmentBox.SelectedIndex;
            if (errors.Length != 0) 
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentDesignWork.DesignWorkID == 0) ProjectOranizationDBEntities.GetContext().DesingWork.Add(_currentDesignWork);
            try
            {
                ProjectOranizationDBEntities.GetContext().SaveChanges();
                MessageBox.Show("Данные сохранены");
                Manager.Frame.GoBack();
            }
            catch
            (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            Manager.Frame.GoBack();
        }
    }
}
