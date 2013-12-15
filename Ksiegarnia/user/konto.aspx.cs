using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ksiegarnia.user
{
    public partial class konto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("/");
            }
            else
            {


            }

        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FormView1.ChangeMode(FormViewMode.Edit);
            FormView1.DataBind();
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            /*   datalist_sors.UpdateParameters["KsiazkaID"].DefaultValue = DataList1.DataKeys[e.Item.ItemIndex].ToString();
               datalist_sors.UpdateParameters["cena"].DefaultValue = ((TextBox)e.Item.FindControl("TextBoxCena")).Text;
               datalist_sors.UpdateParameters["tytul"].DefaultValue = ((TextBox)e.Item.FindControl("TextBoxTytul")).Text;
               datalist_sors.UpdateParameters["dostepnosc"].DefaultValue = ((CheckBox)e.Item.FindControl("CheckBoxDost")).Checked.ToString();
          
               FormView1.Update();  */

            FormView1.ChangeMode(FormViewMode.ReadOnly);
            FormView1.DataBind();
        }
    }
}