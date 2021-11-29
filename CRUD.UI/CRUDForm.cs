//using DataAccess.DbAccess;
//using DataAccess.Helpers;
//using DataAccess.Models;
//using DataAccess.Repositories;
using DataAccess.XS.DbAccess;
using DataAccess.XS.Helpers;
using DataAccess.XS.Interfaces;
using DataAccess.XS.Models;
using DataAccess.XS.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Windows.Forms;

namespace CRUD.UI
{
    public partial class CRUDForm : Form
    {
        private List<User> users;
        private readonly UserRepository userRepository;

        public CRUDForm()
        {
            InitializeComponent();

            string connectionId = ConfigurationManager.AppSettings.Get("connectionId");
            ISqlAccess dbAccess = DBAccessHelper.GetSqlAccess(connectionId);
            userRepository = new UserRepository(dbAccess);

            this.Text = this.Text + $" - {connectionId}";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Create
            User user = new User();
            user.FirstName = tbFirstName.Text;
            user.LastName = tbLastName.Text;

            userRepository.InsertUser(user);

            tbFirstName.Text = "";
            tbLastName.Text = "";

            LoadUsers();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            // Update
            User selectedUser = (User)dataGridView1.CurrentRow?.DataBoundItem;
            if (selectedUser == null)
            {
                return;
            }
            selectedUser.FirstName = tbFirstName.Text;
            selectedUser.LastName = tbLastName.Text;

            userRepository.UpdateUser(selectedUser);

            LoadUsers();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            // Delete
            User selectedUser = (User)dataGridView1.CurrentRow?.DataBoundItem;

            if (selectedUser == null)
            {
                return;
            }

            userRepository.DeleteUser(selectedUser.Id);
            LoadUsers();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Read
            GetUsers();
        }

        private void GetUsers()
        {
            LoadUsers();
        }

        private async void LoadUsers()
        {
            users = await userRepository.GetUsers();
            this.dataGridView1.DataSource = null;
            this.dataGridView1.DataSource = users;
           
        }

        private void CRUDForm_Load(object sender, EventArgs e)
        {
            LoadUsers();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            //this.Text = dataGridView1.CurrentRow.Index.ToString();
            User selectedUser = (User)dataGridView1.CurrentRow.DataBoundItem;

            this.lblID.Text = selectedUser.Id.ToString();
            this.tbFirstName.Text = selectedUser.FirstName;
            this.tbLastName.Text = selectedUser.LastName;
        }
    }
}
