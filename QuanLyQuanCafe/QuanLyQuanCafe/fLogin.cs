using QuanLyQuanCafe.DAO;
using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanCafe
{
    public partial class fLogin : Form
    {
        public fLogin()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;
            string passWord = txbPassWord.Text;
            if (Login(userName, passWord))
            {
                Account loginAccount = AccountDAO.Instance.GetAccountByUserName(userName);
                fTableManager f = new fTableManager(loginAccount);
                this.Hide();
                f.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Sai tên tài khoản hoặc mật khẩu!");
            }
        }

        bool Login(string userName, string passWord)
        {
            return AccountDAO.Instance.Login(userName, passWord);
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void fLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn có thật sự muốn thoát chương trình?", "Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;
            }
        }

        private void closeBtn_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void txbUserName_Click(object sender, EventArgs e)
        {
            txbUserName.BackColor = Color.White;
            panel2.BackColor = Color.White;

            panel3.BackColor = SystemColors.Control;
            txbPassWord.BackColor = SystemColors.Control;
        }

        private void txbPassWord_Click(object sender, EventArgs e)
        {
            txbPassWord.BackColor = Color.White;
            panel3.BackColor = Color.White;
            txbUserName.BackColor = SystemColors.Control;
            panel2.BackColor = SystemColors.Control;
        }
    }
}
