using Flowers.Model;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
    /// Логика взаимодействия для AddFlowerWindow.xaml
    /// </summary>
    public partial class AddFlowerWindow : Window
    {
        private bool isFlower = true;
        private Flower flower = new Flower();
        private Ikebana ikebana = new Ikebana();
        private bool isAdd = true;
        public AddFlowerWindow(bool IsFlower, Flower Flower, Ikebana Ikebana, bool IsAdd)
        {
            InitializeComponent();

            this.isFlower = IsFlower;
            this.flower = Flower;
            this.ikebana = Ikebana;
            this.isAdd = IsAdd;

            if (isFlower)
            {
                if (isAdd)
                {
                    this.Title = "Добавление цветка";
                }
                else
                {
                    this.Title = "Редактирование цветка";
                    nameTB.Text = flower.Name;
                    desTB.Text = flower.Description;
                    pathTB.Text = flower.Image;
                }
            }
            else
            {
                if (isAdd)
                {
                    this.Title = "Добавление икебаны";
                }
                else
                {
                    this.Title = "Редактирование икебаны";
                    nameTB.Text = ikebana.Name;
                    desTB.Text = ikebana.Description;
                    pathTB.Text = ikebana.Image;
                }
            }
        }

        // Добавление пути для фото
        private void addPathBtn_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Title = "Select a picture";
            ofd.Filter = "All supported graphics|*.jpg;*.jpeg;*.png|" +
              "JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|" +
              "Portable Network Graphic (*.png)|*.png";
            if (ofd.ShowDialog() == true)
            {
                pathTB.Text = ofd.FileName;
            }
        }

        // Сохранение
        private void btnAddFlower_Click(object sender, RoutedEventArgs e)
        {
            var newFlower = new Flower();
            var newIkebana = new Ikebana();
            if (!isAdd)
            {
                if (isFlower)
                {
                    if (flower.Id != null)
                    {
                        newFlower.Id = flower.Id;
                    }
                }
                 else
                {
                    if (ikebana.Id != null)
                    {
                        newIkebana.Id = ikebana.Id;
                    }
                }
            }
            

            bool nameL = nameTB.Text.Length > 0 && nameTB.Text.Trim().Length != 0;
            bool desL = desTB.Text.Length > 0 && desTB.Text.Trim().Length != 0;
            bool pathL = pathTB.Text.Length > 0 && pathTB.Text.Trim().Length != 0;

            if (!nameL)
            {
                MessageBox.Show("Введите название", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                if (isFlower)
                {
                    newFlower.Name = nameTB.Text;
                }
                else
                {
                    newIkebana.Name = nameTB.Text;
                }
            }
            if (!desL)
            {
                MessageBox.Show("Введите описание", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                if (isFlower)
                {
                    newFlower.Description = desTB.Text;
                }
                else
                {
                    newIkebana.Description = desTB.Text;
                }
            }
            if (!pathL)
            {
                MessageBox.Show("Введите путь", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                if (isFlower)
                {
                    newFlower.Image = pathTB.Text;
                }
                else
                {
                    newIkebana.Image = pathTB.Text;
                }
            }

            if ((newFlower.Name != null && newFlower.Image != null && newFlower.Description != null) || (newIkebana.Name != null && newIkebana.Image != null && newIkebana.Description != null))
            {
                using (FlowerDBEntities db = new FlowerDBEntities())
                {
                    if (isFlower)
                    {
                        db.Flower.AddOrUpdate(newFlower);
                    }
                    else
                    {
                        db.Ikebana.AddOrUpdate(newIkebana);
                    }
                    db.SaveChanges();
                }
                this.Close();
            }
        }
    }
}
