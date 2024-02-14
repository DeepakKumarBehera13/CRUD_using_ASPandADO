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
    public partial class RESET_PWD : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Btn_Cancel_Click(object sender, EventArgs e)
        {
            TextBox[] arr = { txt_UserName, txt_Password, txt_New_Pwd, txt_Confirm_Pwd };
            foreach (TextBox t in arr)
            {
                t.Text = "";
            }
            arr[0].Focus();
        }

        protected void Btn_Reset_Pwd_Click(object sender, EventArgs e)
        {
            if (txt_New_Pwd.Text == txt_Confirm_Pwd.Text)
            {
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = "Pro_Reset_Pwd";
                cmd.Parameters.AddWithValue("@UserName",txt_UserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Old_Password",ENCRYPT_DECRYPT.Encrypt(txt_Password.Text.Trim()));
                cmd.Parameters.AddWithValue("@New_Password",ENCRYPT_DECRYPT.Encrypt(txt_New_Pwd.Text.Trim()));
                cmd.Parameters.AddWithValue("@ConfirmPassword",ENCRYPT_DECRYPT.Encrypt(txt_Confirm_Pwd.Text.Trim()));
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                con.Close();
                TextBox[] arr = { txt_UserName, txt_Password, txt_New_Pwd, txt_Confirm_Pwd };
                foreach (TextBox t in arr)
                {
                    t.Text = "";
                }
                Response.Write("<script>alert('PASSWORD CHANGED!!!')</script>");
                arr[0].Focus();
            }
            else
            {
                Response.Write("<script>alert('CONFIRM PASSWORD IS NOT CORRECT!!!')</script>");
                txt_New_Pwd.Text = "";
                txt_Confirm_Pwd.Text = "";
                txt_New_Pwd.Focus();
            }
        }

        protected void Lnk_Back_SignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}