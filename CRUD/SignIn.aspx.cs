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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        SqlDataReader rdr;
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Btn_SignIn_Click(object sender, EventArgs e)
        {     
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Usp_SignIn";
            cmd.Parameters.AddWithValue("@UserName", txt_UserName.Text.Trim());
            cmd.Parameters.AddWithValue("@Password_",ENCRYPT_DECRYPT.Encrypt(txt_Pwd.Text.Trim()));
            cmd.Parameters.AddWithValue("@Action", 'L');
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            if (rdr.Read()==true)
            {
                Session["UserName"] = rdr["UserName"].ToString();
                Session["Password_"] = rdr["Password_"].ToString();
                rdr.Close();
                con.Close();
                Session["UserName"] = txt_UserName.Text;
                Response.Redirect("DetailsPage.aspx");   
            }
            else if(rdr.Read()==false)
            {
                rdr.Close();
                cmd.Dispose();
                con.Close();
                Response.Write("<script>alert('Invalid Credentials!!!')</script>");
            }
        }

        protected void Link_SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUpPage.aspx");
        }

        protected void Link_ForgetPwd_Click(object sender, EventArgs e)
        {
            Response.Redirect("FORGET_PWD.aspx");
        }

        protected void Lnk_Reset_Pwd_Click(object sender, EventArgs e)
        {
            Response.Redirect("RESET_PWD.aspx");
        }
    }
}