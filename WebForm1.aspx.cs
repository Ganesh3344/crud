using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Xml.Linq;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GetstudentList();
            }


        }

        SqlConnection Connection = new SqlConnection("Data Source=GANESHPC;database=Ganesh;Integrated Security=True;");
        protected void txtSubmit_Click(object sender, EventArgs e)
        {
            int StudentID = int.Parse(txtstudentID.Text);
            string Name = txtName.Text;
            string Dob = txtDOB.Text;
            string Address = txtAddress.Text;
            string Email = txtEmail.Text;
            string gender = string.Empty;
            if (rbmale.Checked)
            {
                gender = "Male";

            }
            else if (rbfemale.Checked)
            {
                gender = "Female";
            }
            else
            {
                gender = "Gender Not selected.";
            }

            string hobbies = string.Empty;
            if (chkplay.Checked)
            {
                hobbies += chkplay.Value + ",";
            }
             if (chkwriting.Checked)
            {
                hobbies += chkwriting.Value + ",";
                      }
            if (chkmusic.Checked)
            {
                hobbies += chkmusic.Value + ",";
            }

            Connection.Open();


            SqlCommand checkcommand = new SqlCommand("select StudentID from student  where studentID ='" +txtstudentID.Text +"'" ,Connection);
            SqlDataAdapter sd = new SqlDataAdapter(checkcommand);
            DataTable dt1 = new DataTable();
            sd.Fill(dt1);

            if (dt1.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('StudentID already Inserted..');", true);

            }
            else
            {
                SqlCommand command = new SqlCommand("insert into Student Values ('" + StudentID + "','" + Name + "','" + Dob + "','" + Address + "','" + Email + "','" + gender + "','" + hobbies + "')", Connection);
                command.ExecuteNonQuery();
                Connection.Close();
                GetstudentList();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully Inserted..');", true);
                clearform();
            }
        }
           
        
        void GetstudentList()
        {
            SqlCommand command = new SqlCommand("select * FROM student", Connection);
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
      
        protected void txtUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand("select * FROM student", Connection);
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int StudentID = int.Parse(txtstudentID.Text);
            string Name = txtName.Text;
            string Dob = txtDOB.Text;
            string Address = txtAddress.Text;
            string Email = txtEmail.Text;
            string gender = string.Empty;
            if (rbmale.Checked)
            {
                gender = "Male";

            }
            else if (rbfemale.Checked)
            {
                gender = "Female";
            }
            else
            {
                gender = "Gender Not selected.";
            }

            string hobbies = string.Empty;
            if (chkplay.Checked)
            {
                hobbies += chkplay.Value + ",";
            }
            if (chkwriting.Checked)
            {
                hobbies += chkwriting.Value + ",";
            }
            if (chkmusic.Checked)
            {
                hobbies += chkmusic.Value + ",";
            }
            Connection.Open();
            SqlCommand command = new SqlCommand("Exec _updatestudent '" + StudentID + "', '" + Name + "', '" + Dob + "', '" + Address + "', '" + Email + "', '" + gender + "', '" + hobbies + "'", Connection);
            command.ExecuteNonQuery();
            Connection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully Updated..');", true);
            GetstudentList();
            clearform();

        }
        void clearform()
        {
            txtstudentID.Text = string.Empty;
            txtName.Text = string.Empty;
            txtDOB.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtEmail.Text = string.Empty;
            chkplay.Checked = false;
            chkwriting.Checked = false;
            chkmusic.Checked = false;
            rbmale.Checked = false;
            rbfemale.Checked = false;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int StudentID = int.Parse(txtstudentID.Text);
           
            Connection.Open();
            SqlCommand command = new SqlCommand("Exec _deletestudent '" + StudentID + "'", Connection);
            command.ExecuteNonQuery();
            Connection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully deleted');",true);
            GetstudentList();
            clearform();
        }
    }
}