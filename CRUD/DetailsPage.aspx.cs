using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace CRUD
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        SqlDataReader rdr;

        void Disp_Emp_Details()
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Disp_Emp_Details";
            rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            rdr.Close();
            con.Close();
        }

        public void Clear()
        {
            txt_Id.Text = "";
            txt_FirstName.Text = "";
            txt_LastName.Text = "";
            txt_Mobile.Text = "";
            txt_Email.Text = "";
            txt_UserName.Text = "";
            txt_Age.Text = "";
            txt_DOB.Text = "";
            txt_DOJ.Text = "";
            txt_PinCode.Text = "";
            rdb_MALE.Checked = false;
            rdb_FEMALE.Checked = false;
            DD_Qualification.SelectedIndex = 0;
            DD_Country.SelectedIndex = 0;
            DD_State.SelectedIndex = 0;
            DD_District.SelectedIndex = 0;
            DD_City.SelectedIndex = 0;
        }

        public void Disp_Qualification()
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Disp_Qualification";
            DD_Qualification.DataSource = cmd.ExecuteReader();
            DD_Qualification.DataTextField = "Q_Name";
            DD_Qualification.DataValueField = "Q_Name";
            DD_Qualification.DataBind();
            con.Close();
            DD_Qualification.Items.Insert(0, " ");
        }

        public void Disp_Country()
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Disp_Country";
            DD_Country.DataSource = cmd.ExecuteReader();
            DD_Country.DataTextField = "C_Name";
            DD_Country.DataValueField = "C_Name";
            DD_Country.DataBind();
            con.Close();
            DD_Country.Items.Insert(0, " ");
        }

        public void Disp_State()
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Disp_State";
            DD_State.DataSource = cmd.ExecuteReader();
            DD_State.DataTextField = "S_Name";
            DD_State.DataValueField = "S_Name";
            DD_State.DataBind();
            con.Close();
            DD_State.Items.Insert(0, " ");
        }     
        public void Disp_District()
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Disp_District";
            DD_District.DataSource = cmd.ExecuteReader();
            DD_District.DataTextField = "D_Name";
            DD_District.DataValueField = "D_Name";
            DD_District.DataBind();
            con.Close();
            DD_District.Items.Insert(0, " ");
        }
        public void Disp_City()
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Disp_City";
            DD_City.DataSource = cmd.ExecuteReader();
            DD_City.DataTextField = "City_Name";
            DD_City.DataValueField = "City_Name";
            DD_City.DataBind();
            con.Close();
            DD_City.Items.Insert(0, " ");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_UserName.Text = Session["UserName"].ToString();
            if (Page.IsPostBack != true)
            {
                Disp_Emp_Details();
                Disp_Qualification();
                Disp_Country();
                Disp_State();
                Disp_District();
                Disp_City();
            }
        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            File_Photo.PostedFile.SaveAs(Server.MapPath("image/" + File_Photo.FileName));
            string GENDER = "MALE";
            if (rdb_MALE.Checked == true)
            {
                GENDER = "MALE";
            }
            if (rdb_FEMALE.Checked == true)
            {
                GENDER = "FEMALE";
            }

            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Pro_Update_Details";
            cmd.Parameters.AddWithValue("@Emp_Id",txt_Id.Text.Trim());
            cmd.Parameters.AddWithValue("@FirstName", txt_FirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@LastName", txt_LastName.Text.Trim());
            cmd.Parameters.AddWithValue("Photo", "image/" + File_Photo.FileName);
            cmd.Parameters.AddWithValue("@Gender", GENDER);
            cmd.Parameters.AddWithValue("@Qualification", DD_Qualification.SelectedItem.Text.Trim());
            cmd.Parameters.AddWithValue("@DateOfBirth", txt_DOB.Text.Trim());
            cmd.Parameters.AddWithValue("@Age", txt_Age.Text.Trim());
            cmd.Parameters.AddWithValue("@DateOfJoin", txt_DOJ.Text.Trim());
            cmd.Parameters.AddWithValue("@City", DD_City.SelectedItem.Text.Trim());
            cmd.Parameters.AddWithValue("@District", DD_District.SelectedItem.Text.Trim());
            cmd.Parameters.AddWithValue("@State_", DD_State.SelectedItem.Text.Trim());
            cmd.Parameters.AddWithValue("@Country", DD_Country.SelectedItem.Text.Trim());
            cmd.Parameters.AddWithValue("@PinCode", txt_PinCode.Text.Trim());
            cmd.Parameters.AddWithValue("@Action", 'U');
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            con.Close();
            Disp_Emp_Details();
            Clear();
            Response.Write("<script>alert('Required Details Updated Successfully!!!')</script>");
        }

        protected void Disp(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Disp_Emp_Details();
        }

        protected void Edit(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Disp_Emp_Details();
        }
        protected void Cancel(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Clear();
            Disp_Emp_Details();
        }

        protected void Btn_Edit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Search_Previous_Data";
            cmd.Parameters.AddWithValue("@Emp_id", btn.CommandArgument.ToString());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                txt_Id.Text = rdr["Emp_Id"].ToString();
                txt_Mobile.Text = rdr["Mobile"].ToString();
                txt_Email.Text = rdr["Email"].ToString();
                txt_UserName.Text = rdr["UserName"].ToString();
            }
            rdr.Close();
            con.Close();
        }

        protected void Btn_Delete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Del_Record";
            cmd.Parameters.AddWithValue("@Emp_id", btn.CommandArgument);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            con.Close();
            Clear();
            Response.Write("<script>alert('Account Deleted!!!')</script>");
            Disp_Emp_Details();
        }

        protected void Btn_SignOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}