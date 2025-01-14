﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApp1.Customer;

namespace WindowsFormsApp1
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void borrowBookToolStripMenuItem_Click(object sender, EventArgs e)
        {
            txtName borrowListForm1 = new txtName();
            borrowListForm1.MdiParent = this;
            borrowListForm1.Show();
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void importBookToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ImportListForm importListForm = new ImportListForm();
            importListForm.MdiParent = this;
            importListForm.Show();
        }

        private void returnBookToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ReturnForm returnForm = new ReturnForm();
            returnForm.MdiParent = this;
            returnForm.Show();
        }

        private void createUserToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CreateCustomer createCustomer = new CreateCustomer();
            createCustomer.MdiParent = this;
            createCustomer.Show();
        }

        private void deleteCustomerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DeleteCustomer deleteCustomer = new DeleteCustomer();
            deleteCustomer.MdiParent = this;
            deleteCustomer.Show();
        }
    }
}
