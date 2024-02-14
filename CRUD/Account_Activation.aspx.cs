using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
namespace CRUD
{
    public partial class Account_Activation : System.Web.UI.Page
    {     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ActivateMyAccount();
            }
        }
        private void ActivateMyAccount()
        {
            DateTime createdOn = DateTime.Now;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            string token = Request.QueryString["token"];
            if (!string.IsNullOrEmpty(token))
            {
                SqlCommand cmd = new SqlCommand("Select dtm_CreatedOn from Emp_Details where Token=@Token", con);
                cmd.Parameters.AddWithValue("@Token", token);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    createdOn = Convert.ToDateTime(rdr["dtm_CreatedOn"].ToString());
                }
                rdr.Close();
                if ((DateTime.Now - createdOn).TotalMinutes <= 10)
                {
                    try
                    {
                      cmd = new SqlCommand("UPDATE Emp_Details SET Active_Status=1 WHERE Token=@Token", con);
                      cmd.Parameters.AddWithValue("@Token", token);
                      cmd.ExecuteNonQuery();
                      Response.Write("You account has been activated. You can <a href='SignIn.aspx'>SignIn</a> now! ");
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
                        return;
                    }
                    finally
                    {
                        con.Close();
                        cmd.Dispose();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Sorry ! Sign in session Expired!!!')</script>");
                }
            }                
        }
    }
}