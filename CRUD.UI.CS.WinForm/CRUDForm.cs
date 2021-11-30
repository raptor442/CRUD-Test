using DataAccess.CS.Interfaces;
using DataAccess.CS.Helpers;
using DataAccess.CS.Models;
using DataAccess.CS.Repositories;
using DataAccess.CS.Config;
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace CRUD.UI
{
    public partial class CRUDForm : Form
    {
        private List<User> users;
        private readonly IUserRepository userRepository;

        public CRUDForm()
        {
            InitializeComponent();

            IConfigSettings configSettings = new ConfigSettings();
            ISqlAccess dbAccess = DBAccessHelper.GetSqlAccess(configSettings);
            userRepository = new UserRepository(dbAccess);

            Text += $" - {configSettings.ConnectionId}";
        }

        private async void button1_Click(object sender, EventArgs e)
        {
            // Create
            User user = new User();
            user.FirstName = tbFirstName.Text;
            user.LastName = tbLastName.Text;

            await userRepository.InsertUser(user);

            tbFirstName.Text = "";
            tbLastName.Text = "";

            LoadUsers();
        }

        private async void button3_Click(object sender, EventArgs e)
        {
            // Update
            User selectedUser = (User)dataGridView1.CurrentRow?.DataBoundItem;
            if (selectedUser == null)
            {
                return;
            }
            selectedUser.FirstName = tbFirstName.Text;
            selectedUser.LastName = tbLastName.Text;

            await userRepository.UpdateUser(selectedUser);

            LoadUsers();
        }

        private async void button4_Click(object sender, EventArgs e)
        {
            // Delete
            User selectedUser = (User)dataGridView1.CurrentRow?.DataBoundItem;

            if (selectedUser == null)
            {
                return;
            }

            await userRepository.DeleteUser(selectedUser.Id);

            LoadUsers();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Read
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
            User selectedUser = (User)dataGridView1.CurrentRow.DataBoundItem;

            this.lblID.Text = selectedUser.Id.ToString();
            this.tbFirstName.Text = selectedUser.FirstName;
            this.tbLastName.Text = selectedUser.LastName;
        }
    }
}
