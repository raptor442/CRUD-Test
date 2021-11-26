using DataAccess.DbAccess;
using DataAccess.Models;
using DataAccess.Repositories;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
            ISqlAccess db = new SqliteAccess("sqlite");
            userRepository = new UserRepository(db);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Create
        }

        private void button3_Click(object sender, EventArgs e)
        {
            // Update
        }

        private void button4_Click(object sender, EventArgs e)
        {
            // Delete
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
    }
}
