using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.NetworkInformation;
using System.Security.Cryptography;

namespace practiceWebformApplication
{
    
    public partial class UserForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-84MRHNGB; initial catalog=db_webprac; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                userDisplay();
                countryBind();
               
            }
        }

        public void countryBind()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblcountry", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            ddlcounrty.DataValueField = "Cid";
            ddlcounrty.DataTextField = "Cname";
            ddlcounrty.DataSource = dt;
            ddlcounrty.DataBind();
            ddlcounrty.Items.Insert(0, new ListItem("--select--", "0"));
        }
        public void stateBind()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblstate where Cid='"+ddlcounrty.SelectedValue+"'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            ddlstate.DataValueField = "Sid";
            ddlstate.DataTextField = "Sname";
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("--select--", "0"));
        }

        public void userDisplay()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("USP_Show", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter sda=new SqlDataAdapter(cmd);
      
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            Gvusers.DataSource = dt;
            Gvusers.DataBind();
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (btnsubmit.Text == "Submit") { 
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into users (userName,userAge,userNumber,userGender,userCountry,userState)values('" + txtname.Text+ "','"+txtage.Text+"','"+txtnumber.Text+"','"+rblgender.SelectedValue+"','"+ddlcounrty.SelectedValue+ "','"+ddlstate.SelectedValue+"')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            userDisplay();
            clear();
            }
            else if(btnsubmit.Text =="Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update  users set userName='" + txtname.Text + "', userAge='" + txtage.Text + "',userNumber='"+ txtnumber.Text + "',userGender='"+rblgender.SelectedValue+ "',userCountry='"+ddlcounrty.SelectedValue+ "',userState='"+ddlstate.SelectedValue+"' where userID='" + ViewState["id"] + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                userDisplay();
                clear();

            }
        }

        protected void Gvusers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A") { 
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from users where userID='"+e.CommandArgument+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
                userDisplay();
            }

            else if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from users where userID='"+e.CommandArgument+"' ", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable(); ;
                sda.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["userName"].ToString();
                txtage.Text = dt.Rows[0]["userAge"].ToString();
                txtnumber.Text = dt.Rows[0]["userNumber"].ToString();
                rblgender.SelectedValue= dt.Rows[0]["userGender"].ToString();
                ddlcounrty.SelectedValue= dt.Rows[0]["userCountry"].ToString();
                stateBind();
                ddlstate.SelectedValue = dt.Rows[0]["userState"].ToString();
                btnsubmit.Text = "Update";
                ViewState["id"] = e.CommandArgument;
            }
           
    }
        public void clear()
        {
            txtname.Text = "";
            txtage.Text = "";
            txtnumber.Text = "";
            rblgender.ClearSelection();
            ddlcounrty.SelectedValue = "0";
            ddlstate.SelectedValue = "0";
            btnsubmit.Text = "Submit";

        }

        protected void ddlcounrty_SelectedIndexChanged(object sender, EventArgs e)
        {
            stateBind();
        }
    }
}