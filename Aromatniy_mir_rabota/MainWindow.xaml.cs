using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Security.Cryptography.X509Certificates;
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

namespace Aromatniy_mir_rabota
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        public void Click_katalog(object sender, EventArgs e)
        {
            Katalog katalog = new Katalog();
            this.Hide();
            katalog.Show();
        }

        public void Poisk()
        {
            TradeEntities entities = new TradeEntities();
            User schet = null;
            schet = entities.User.Where(a => a.UserLogin == Login.Text && a.UserPassword == Pass.Text).FirstOrDefault();

            if (schet == null)
            {
                MessageBox.Show("такого аккаунта не существует!");
            }
            else
            {
                Katalog katalog = new Katalog();
                this.Hide();
                katalog.Show();
            }
           
           
        }
        public void Role()
        {
            TradeEntities entities = new TradeEntities();
            

        }
        public void Click_avtor(object sender, EventArgs e)
        {
            Poisk();
        }
    }
}
