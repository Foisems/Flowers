using Flowers.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Flowers.View
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private int? idRole = null;
        public MainWindow(int? IdRole = null)
        {
            InitializeComponent();

            dataGridFlower.ItemsSource = FlowerDBEntities.GetContext().Flower.ToList();
            dataGridIkebana.ItemsSource = FlowerDBEntities.GetContext().Ikebana.ToList();

            idRole = IdRole;

            if(idRole == null)
            {
                btnAddFlower.Visibility = Visibility.Collapsed;
                btnUpdateFlower.Visibility = Visibility.Collapsed;

                btnAddIkebana.Visibility = Visibility.Collapsed;
                btnUpdateIkebana.Visibility = Visibility.Collapsed;

            }
        }

        // Обновление списка цветов
        private void btnUpdateFlower_Click(object sender, RoutedEventArgs e)
        {
            dataGridFlower.ItemsSource = FlowerDBEntities.GetContext().Flower.ToList();
        }

        // Добавление цветка
        private void btnAddFlower_Click(object sender, RoutedEventArgs e)
        {
            AddFlowerWindow addFlowerWindow = new AddFlowerWindow(true, null, null, true);
            addFlowerWindow.ShowDialog();
        }

 
        // Открыть информацию о цветке
        private void btnOpenFlower_Click(object sender, RoutedEventArgs e)
        {
            Flower flowerBtn = (sender as Button).DataContext as Flower;

            FlowerWindow flowerWindow = new FlowerWindow(true, flowerBtn, null, idRole);
            flowerWindow.ShowDialog();
        }

        // Выйти из профиля
        private void Quit_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
        }

        // Обновить список икебан
        private void btnUpdateIkebana_Click(object sender, RoutedEventArgs e)
        {
            dataGridIkebana.ItemsSource = FlowerDBEntities.GetContext().Ikebana.ToList();
        }

        // Добавить икебану
        private void btnAddIkebana_Click(object sender, RoutedEventArgs e)
        {
            AddFlowerWindow addFlowerWindow = new AddFlowerWindow(false, null, null, true);
            addFlowerWindow.ShowDialog();
        }

        // Открыть информацию об икебане
        private void btnOpenIkebana_Click(object sender, RoutedEventArgs e)
        {
            Ikebana ikebanaBtn = (sender as Button).DataContext as Ikebana;

            FlowerWindow flowerWindow = new FlowerWindow(false, null, ikebanaBtn, idRole);
            flowerWindow.ShowDialog();
        }

        // Закрытие программы
        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            App.Current.Shutdown();
        }
    }
}
