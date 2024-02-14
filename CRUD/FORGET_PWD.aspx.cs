using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Web.UI.WebControls;
namespace CRUD
{
    public partial class FORGET_PWD : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Btn_Send_Click(object sender, EventArgs e)
        {
            string UserName = "";
            string Password_ = "";
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandText = "Pro_Retrieve_Pwd";
            cmd.Parameters.AddWithValue("@Email", txt_Email_id.Text.Trim());
            cmd.CommandType = CommandType.StoredProcedure;
            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                if (rdr.Read())
                {
                    UserName = rdr["UserName"].ToString();
                    Password_ = rdr["Password_"].ToString();
                }
            }
            con.Close();

            if (!string.IsNullOrEmpty(Password_))
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("Deepak96589@gmail.com");
                msg.To.Add(txt_Email_id.Text);
                msg.Subject = " Recover your Password";
                msg.Body = ("Your Username is:" + UserName + "<br/><br/>" + "Your Password is:" + Password_);
                msg.IsBodyHtml = true;
                SmtpClient smt = new SmtpClient();
                smt.Host = "smtp.gmail.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = "Deepak96589@gmail.com";   
                ntwd.Password = "qhlxyascuepptyhg"; 
                smt.UseDefaultCredentials = true;
                smt.Credentials = ntwd;
                smt.Port = 587;
                smt.EnableSsl = true;
                smt.Send(msg);
                lblMessage.Text = "Username and Password Sent Successfully";
                lblMessage.ForeColor = System.Drawing.Color.ForestGreen;
            }
        }
        protected void lnk_BacktoLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}