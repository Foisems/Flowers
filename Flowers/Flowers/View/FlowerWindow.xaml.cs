using Flowers.Model;
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
using System.Windows.Shapes;

namespace Flowers.View
{
    /// <summary>
    /// Логика взаимодействия для FlowerWindow.xaml
    /// </summary>
    public partial class FlowerWindow : Window
    {
        private bool isFlower = true;
        private Flower flower = new Flower();
        private Ikebana ikebana = new Ikebana();
        private int? idRole = null;
        public FlowerWindow(bool IsFlower, Flower Flower, Ikebana Ikebana, int? IdRole)
        {
            InitializeComponent();

            this.isFlower = IsFlower;
            this.flower = Flower;
            this.ikebana = Ikebana;
            this.idRole = IdRole;

            if(idRole == null)
            {
                btnEditFlower.Visibility = Visibility.Collapsed;
                btnDelFlower.Visibility = Visibility.Collapsed;
            }
            else
            {
                btnEditFlower.Visibility = Visibility.Visible;
                btnDelFlower.Visibility = Visibility.Visible;
            }

            using (FlowerDBEntities db = new FlowerDBEntities())
            {
                if (isFlower)
                {
                    try
                    {
                        imgFlower.Source = new BitmapImage(new Uri(db.Flower.FirstOrDefault(u => u.Id == flower.Id).Image));
                        errorImgLabel.Visibility = Visibility.Collapsed;
                    }
                    catch
                    {
                        imgFlower.Source = null;
                        errorImgLabel.Visibility = Visibility.Visible;
                    }
                    nameFlowerTB.Text = "Название:\n" + db.Flower.FirstOrDefault(u => u.Id == flower.Id).Name;
                    desFlowerTB.Text = "Описание:\n" + db.Flower.FirstOrDefault(u => u.Id == flower.Id).Description;
                }
                else
                {
                    try
                    {
                        imgFlower.Source = new BitmapImage(new Uri(db.Ikebana.FirstOrDefault(u => u.Id == ikebana.Id).Image));
                        errorImgLabel.Visibility = Visibility.Collapsed;
                    }
                    catch
                    {
                        imgFlower.Source = null;
                        errorImgLabel.Visibility = Visibility.Visible;
                    }
                    nameFlowerTB.Text = "Название:\n" + db.Ikebana.FirstOrDefault(u => u.Id == ikebana.Id).Name;
                    desFlowerTB.Text = "Описание:\n" + db.Ikebana.FirstOrDefault(u => u.Id == ikebana.Id).Description;
                }
            }
        }

        // Редактировать информацию
        private void btnEditFlower_Click(object sender, RoutedEventArgs e)
        {
            AddFlowerWindow addFlowerWindow;
            if (isFlower)
            {
                addFlowerWindow = new AddFlowerWindow(true, flower, null, false);
            }
            else
            {
                addFlowerWindow = new AddFlowerWindow(false, null, ikebana, false);
            }
            this.Close();
            addFlowerWindow.ShowDialog();
            
        }

        // Удаление
        private void btnDelFlower_Click(object sender, RoutedEventArgs e)
        {
            using (FlowerDBEntities db = new FlowerDBEntities())
            {
                if (MessageBox.Show("Вы уверены, что хотите удалить?", "Предупреждение", MessageBoxButton.YesNo, MessageBoxImage.Question) ==
                        MessageBoxResult.Yes)
                {
                    if (isFlower)
                    {
                        var delFlower = db.Flower.FirstOrDefault(u => u.Id == flower.Id);
                        db.Flower.Remove(delFlower);
                        db.SaveChanges();
                    }
                    else
                    {
                        var delIkebana = db.Ikebana.FirstOrDefault(u => u.Id == ikebana.Id);
                        db.Ikebana.Remove(delIkebana);
                        db.SaveChanges();
                    }
                    this.Close();
                }
            }
        }
    }
}
